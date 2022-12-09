Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B999648042
	for <lists+linux-media@lfdr.de>; Fri,  9 Dec 2022 10:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiLIJlM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Dec 2022 04:41:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbiLIJlL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Dec 2022 04:41:11 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3FE03AC32;
        Fri,  9 Dec 2022 01:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1670578869; x=1702114869;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CxvSR/db2Xc7mTrpBpDm/K5V05y4jf2T2xhdJB3fW4c=;
  b=PlGgrJaCsuO4KrS6uu7F86sxQMETjJSJLrQW3+uihLO9t9UGBbJ0r1iw
   opbbxbLFVaJ7OOMH3fj83NDt61XdW4Kkgb3TfkiPI7oHCtCAV9eRk1byO
   bu04QgJl0jBt0dKp7PQ5S21KERebonBFjCSjurrrK5Tdno24F0etX+d4O
   8=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Dec 2022 01:41:08 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 01:41:08 -0800
Received: from mmitkov.eu.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 9 Dec 2022 01:41:04 -0800
From:   <quic_mmitkov@quicinc.com>
To:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <bryan.odonoghue@linaro.org>,
        <cgera@qti.qualcomm.com>, <gchinnab@quicinc.com>,
        <ayasan@qti.qualcomm.com>, <laurent.pinchart@ideasonboard.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Subject: [PATCH v7 0/4] media: camss: sm8250: Virtual channels support for SM8250
Date:   Fri, 9 Dec 2022 11:40:33 +0200
Message-ID: <20221209094037.1148-1-quic_mmitkov@quicinc.com>
X-Mailer: git-send-email 2.37.3.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Milen Mitkov <quic_mmitkov@quicinc.com>

For v7:
- Fix an issue with output state for different versions of the IFE
  hardware (for platforms different from QRB5, e.g. QRB3).

For v6:
- Fix for a potential race condition in csid
- More detailed description on how to use/test this feature in
  user-space in the last patch.

For v5:
- Use entity->use_count instead of s_stream subdev call ret code to
  check if another instance of the pipeline is running. Prevents an
  error on 6.1 and up, when stopping one of several simultaneous
  instances.
- flush buffers instead of just returning if the pipeline didn't start.

For v4:
- fixes the warning reported by the kernel test robot
- tiny code change to enable the vc functionality with the partially-applied
  multistream patches on linux-next (tested on tag:next-20221010)

For v3:
- setting the sink pad format on the CSID entity will now propagate the
  format to the source pads to keep the subdev in a valid internal state.
- code syntax improvements

For v2:
- code syntax improvements
- The info print for the enabled VCs was demoted to a dbg print. Can be
  enabled with dynamic debug, e.g.:
echo "file drivers/media/platform/qcom/camss/* +p" > /sys/kernel/debug/dynamic_debug/control

NOTE: These changes depend on the multistream series, that as of yet
is still not merged upstream. However, part of the
multistream patches are merged in linux-next (tested on
tag:next-20221010), including the patch that introduces the
video_device_pipeline_alloc_start() functionality. This allows 
applying and using this series on linux-next without applying the
complete multistream set.

The CSID hardware on SM8250 can demux the input data stream into
maximum of 4 multiple streams depending on virtual channel (vc)
or data type (dt) configuration.

Situations in which demuxing is useful:
- HDR sensors that produce a 2-frame HDR output, e.g. a light and a dark frame
  (the setup we used for testing, with the imx412 sensor),
  or a 3-frame HDR output - light, medium-lit, dark frame.
- sensors with additional metadata that is streamed over a different
  virtual channel/datatype.
- sensors that produce frames with multiple resolutions in the same pixel
  data stream

With these changes, the CSID entity has, as it did previously, a single
sink port (0), and always exposes 4 source ports (1, 2,3, 4). The
virtual channel configuration is determined by which of the source ports
are linked to an output VFE line. For example, the link below will
configure the CSID driver to enable vc 0 and vc 1:

media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'

which will be demuxed and propagated into /dev/video0
and /dev/video1 respectively. With this, the userspace can use
any normal V4L2 client app to start/stop/queue/dequeue from these
video nodes. Tested with the yavta app.

The format of each RDI channel of the used VFE(s) (msm_vfe0_rdi0,
msm_vfe0_rdi1,...) must also be configured explicitly.

Note that in order to keep a valid internal subdevice state,
setting the sink pad format of the CSID subdevice will propagate
this format to the source pads. However, since the CSID hardware
can demux the input stream into several streams each of which can 
be a different format, in that case each source pad's 
format must be set individually, e.g.:

media-ctl -V '"msm_csid0":1[fmt:SRGGB10/3840x2160]'
media-ctl -V '"msm_csid0":2[fmt:SRGGB10/960x540]'

Milen Mitkov (4):
  media: camss: sm8250: Virtual channels for CSID
  media: camss: vfe: Reserve VFE lines on stream start and link to CSID
  media: camss: vfe-480: Multiple outputs support for SM8250
  media: camss: sm8250: Pipeline starting and stopping for multiple
    virtual channels

 .../platform/qcom/camss/camss-csid-gen2.c     | 54 ++++++++++------
 .../media/platform/qcom/camss/camss-csid.c    | 44 +++++++++----
 .../media/platform/qcom/camss/camss-csid.h    | 11 +++-
 .../media/platform/qcom/camss/camss-vfe-170.c |  4 +-
 .../media/platform/qcom/camss/camss-vfe-480.c | 61 ++++++++++++-------
 .../platform/qcom/camss/camss-vfe-gen1.c      |  4 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |  1 +
 .../media/platform/qcom/camss/camss-video.c   | 21 ++++++-
 drivers/media/platform/qcom/camss/camss.c     |  2 +-
 9 files changed, 138 insertions(+), 64 deletions(-)

-- 
2.37.3

