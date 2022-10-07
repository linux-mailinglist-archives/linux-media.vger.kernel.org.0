Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFE425F78D3
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 15:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbiJGNUq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 09:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbiJGNUo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 09:20:44 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141297F12A;
        Fri,  7 Oct 2022 06:20:42 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297COxkB024004;
        Fri, 7 Oct 2022 13:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=K7jT6MExWJWye8BIsar/NGNPV5tS9/9qbhZNwth2m6c=;
 b=UIdpMMP9lbZ1otXl2C0rkf8YJJBp1uwCxP6lEmiJmhcD0Phuht8tE2XyjW4bgpB9BHus
 LJnFj0nclgTQlhJs/qsic9DQ9z0BktIprDa9iZRfrwbauup87REq9zHh9McHh1SXku2Y
 vLzmBGW4KZs9DFzh2vnQ0Qh25Esf+HoXUg9TltncmFhFMK5O/K6xLXwIR0PxyRJV5J5p
 zGogaxdWZN77Q5ST0mR3UHlL4osH7SA3PKJVAOrPsSnLxN6lArGUKHy0ZHJ7ZVM7b5M6
 ciLUnjIlgDJpRlJFo3ZWWxHViCbLSMvpgTn3BSemmgDIcBEMLqWgNzyyd9fUR7BWJjS7 Gg== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k27419dxy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Oct 2022 13:20:28 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 297DKRMt012603
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 7 Oct 2022 13:20:27 GMT
Received: from mmitkov.eu.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 7 Oct 2022 06:20:24 -0700
From:   <quic_mmitkov@quicinc.com>
To:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <robert.foss@linaro.org>, <akapatra@quicinc.com>,
        <jzala@quicinc.com>, <todor.too@gmail.com>
CC:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <konrad.dybcio@somainline.org>, <mchehab@kernel.org>,
        <bryan.odonoghue@linaro.org>, <cgera@qti.qualcomm.com>,
        <gchinnab@quicinc.com>, <ayasan@qti.qualcomm.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Subject: [PATCH v3 0/4] media: camss: sm8250: Virtual channels support for SM8250
Date:   Fri, 7 Oct 2022 16:20:05 +0300
Message-ID: <20221007132009.1886-1-quic_mmitkov@quicinc.com>
X-Mailer: git-send-email 2.37.3.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SyvAD8CXAK2TbMcHr1hboRdYFLYqtTxh
X-Proofpoint-GUID: SyvAD8CXAK2TbMcHr1hboRdYFLYqtTxh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070080
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Milen Mitkov <quic_mmitkov@quicinc.com>

For v3:
- setting the sink pad format on the CSID entity will now propagate the
  format to the source pads to keep the subdev in a valid internal state.
- code syntax improvements

For v2:
- code syntax improvements
- The info print for the enabled VCs was demoted to a dbg print. Can be
  enabled with dynamic debug, e.g.:
echo "file drivers/media/platform/qcom/camss/* +p" > /sys/kernel/debug/dynamic_debug/control

NOTE: These changes depend on the multistream series that as of yet is
still not completely merged upstream. The multistream changes
allow for multiple clients on the same pipeline, which is otherwise not
possible. The patches were tested with the latest available multistream
API version - v15:

https://www.spinics.net/lists/linux-media/msg219406.html

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
 drivers/media/platform/qcom/camss/camss-vfe.c |  7 +++
 .../media/platform/qcom/camss/camss-video.c   | 21 ++++++-
 drivers/media/platform/qcom/camss/camss.c     |  2 +-
 7 files changed, 140 insertions(+), 60 deletions(-)

-- 
2.37.3

