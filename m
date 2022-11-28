Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C695063AB6A
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 15:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbiK1Oni (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 09:43:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232557AbiK1OnH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 09:43:07 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4D0E0FE;
        Mon, 28 Nov 2022 06:43:06 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ASDMLN1005006;
        Mon, 28 Nov 2022 14:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=b+flTeLVNRI2i/YW6WFzY0JKVSv8TnD6PO7crGrBrOI=;
 b=kQeo0Nnxr5981hkP5xnUuTwHcAeVcs+a5o0lLcgBF1EbNYGXndc+fxNHuV29lWoJBT3a
 OVWeZ5YCK189UtXIpeliR3TxIJLj0n+Jyt0DvNlSZ/EL8aOdBuq0oil1iCv1f2DZpa/z
 SSw5NDYBA4rKlh2o9iPud4WNXIJt55Vbu5YLlTE9KpS1pkKPWFJvPK2jk4DAqHeoEXhK
 fb7M2k7aR51YP7h76fVBPgp7A/GWp1oY7IGW8WTS52I9AKHQFFw4uiwhvHU1HOmElubh
 rDEdRA2pzHOay1ZvRgqXD/TR2n/R9EDw2L9rplBLr6e7oUsyiR22KCn2/++7Ecd6+KeS IQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m38gq4t7t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Nov 2022 14:42:56 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2ASEgtT5006704
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Nov 2022 14:42:55 GMT
Received: from mmitkov.eu.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 28 Nov 2022 06:42:52 -0800
From:   <quic_mmitkov@quicinc.com>
To:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <konrad.dybcio@somainline.org>,
        <mchehab@kernel.org>, <bryan.odonoghue@linaro.org>,
        <cgera@qti.qualcomm.com>, <gchinnab@quicinc.com>,
        <ayasan@qti.qualcomm.com>, <laurent.pinchart@ideasonboard.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Subject: [PATCH v5 0/4] media: camss: sm8250: Virtual channels support for SM8250
Date:   Mon, 28 Nov 2022 16:42:06 +0200
Message-ID: <20221128144210.1028-1-quic_mmitkov@quicinc.com>
X-Mailer: git-send-email 2.37.3.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BP-zYrDfa6vtL69J9OR32eM8reKi5fIQ
X-Proofpoint-ORIG-GUID: BP-zYrDfa6vtL69J9OR32eM8reKi5fIQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_13,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280110
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Milen Mitkov <quic_mmitkov@quicinc.com>

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
 .../media/platform/qcom/camss/camss-vfe-480.c | 61 ++++++++++++-------
 drivers/media/platform/qcom/camss/camss-vfe.c |  1 +
 .../media/platform/qcom/camss/camss-video.c   | 21 ++++++-
 drivers/media/platform/qcom/camss/camss.c     |  2 +-
 7 files changed, 134 insertions(+), 60 deletions(-)

-- 
2.37.3

