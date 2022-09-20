Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC10A5BE92E
	for <lists+linux-media@lfdr.de>; Tue, 20 Sep 2022 16:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiITOiU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Sep 2022 10:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiITOiT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Sep 2022 10:38:19 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C91732DA6
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 07:38:18 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KEFkRa005929
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 14:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=6h0iKYIiSsxenl8UggmVK4unc6auSaDDe25EdGqcXjc=;
 b=CpU8xKwA26Cr6VRdMdzi5RCUApeo5FPOuTvTwGnDtKw+G6aB78Qvb1GeZjJWM5RBOTMl
 570/3Ncbf5UNMTpIYnvMuNVCu0aXlbej/zTo3xtjBl8tIbH32OLrYj9n3FaRFU29+l96
 q6BBH0kUE9cSTdrfDXdbFNHp8PQLS1XwKLWxZ+5IpUbwfzlTigjwuWHd+C2k13Qyvnel
 fzWHl8LxKCfSt3Yv4IEdEcABSfrQwiDTzY28tRcjBgqXRW6VVyz+1dcZeLyglUm1LlZy
 OtBydcCVMhEezy0PfGpF3pnICU2U956QbIFABkG5cxyEcSkzm0pxCwrzO/21+uTT+96G dg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jq04y3102-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 14:38:18 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28KEXHZw024036
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 14:33:17 GMT
Received: from mmitkov.eu.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 20 Sep 2022 07:33:16 -0700
From:   <quic_mmitkov@quicinc.com>
To:     <linux-media@vger.kernel.org>
CC:     <akapatra@quicinc.com>, <jzala@quicinc.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Subject: [PATCH 0/4] media: camss: sm8250: Virtual channels support for SM8250
Date:   Tue, 20 Sep 2022 17:32:56 +0300
Message-ID: <20220920143300.1633-1-quic_mmitkov@quicinc.com>
X-Mailer: git-send-email 2.37.3.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: umbeCyMigNZMy6gaw7BQlgXXZVLJz3RR
X-Proofpoint-GUID: umbeCyMigNZMy6gaw7BQlgXXZVLJz3RR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_06,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200086
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Milen Mitkov <quic_mmitkov@quicinc.com>

These patches add support for multiple CSID virtual channels for Qualcomm's SM8250
platform.

NOTE: These changes depend on the multistream series that as of yet is
still not merged officially upstream. The multistream changes
allow for multiple clients on the same pipeline, which is otherwise not
possible. For development and testing multistream series v14 was used:

https://patchwork.kernel.org/project/linux-media/patch/20220831141357.1396081-2-tomi.valkeinen@ideasonboard.com/

The CSID hardware on SM8250 can demux the input data stream into
maximum of 4 multiple streams depending on virtual channel (vc)
or data type (dt) configuration.

Situations in which this is useful:
- HDR sensors that produce a 2-frame HDR output, e.g. a light and a dark frame
  (the setup we used  for testing, with the imx412 sensor),
  or a 3-frame HDR output - light, medium-lit, dark frame.
- sensors with additional metadata that is streamed over a different
  virtual channel/datatype.
- sensors that stream frames with multiple resolutions in the same pixel
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

Note also that implicit format propagation has been removed, so format
for the linked source ports has to be set manually, e.g.:

media-ctl -V '"msm_csid0":1[fmt:SRGGB10/3840x2160]'
media-ctl -V '"msm_csid0":2[fmt:SRGGB10/3840x2160]'

Previously setting the format on the sink port of the CSID entity would
set the same format on the source port. However, with CSID demuxing there's
no guarantee that the format on the source ports should be the same,
in fact it can be different for each source port.

Milen Mitkov (4):
  media: camss: sm8250: Virtual channels for CSID
  media: camss: vfe: Reserve VFE lines on stream start and link to CSID
  media: camss: vfe-480: Multiple outputs support for SM8250
  media: camss: sm8250: Pipeline starting and stopping for multiple
    virtual channels

 .../platform/qcom/camss/camss-csid-gen2.c     | 55 ++++++++++-------
 .../media/platform/qcom/camss/camss-csid.c    | 41 +++++++------
 .../media/platform/qcom/camss/camss-csid.h    | 11 +++-
 .../media/platform/qcom/camss/camss-vfe-480.c | 60 ++++++++++++-------
 drivers/media/platform/qcom/camss/camss-vfe.c |  7 +++
 .../media/platform/qcom/camss/camss-video.c   | 21 ++++++-
 drivers/media/platform/qcom/camss/camss.c     |  2 +-
 7 files changed, 133 insertions(+), 64 deletions(-)

-- 
2.37.3

