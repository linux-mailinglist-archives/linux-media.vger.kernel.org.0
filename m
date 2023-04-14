Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED116E2079
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 12:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjDNKNe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 06:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjDNKNd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 06:13:33 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E979A83E3
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 03:12:55 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i26so23077803lfc.6
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 03:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noisolation.com; s=google; t=1681467171; x=1684059171;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpMSL9mpptWBMKkZ5mf+l7zqDIp0JFzhLiaDWfzh9X8=;
        b=Ymj89xA5rhr9u1CAAAtLQR4lXawVfThjnSc1hXbKeDOg2ysvxPY5hXgYHQ+ttOIbKu
         NZoBZyB54oo56clyFo0NUaiS80hkSWeL5s2+HQQEHMBpDxKhuWp3+ZyOYhr3iWLiWAPY
         Tvochj8EYsgj8EvK552VBeqD7qo5xRfeUPspbWHBGqesz6k/Nw/cQO+KUFb9cNT6wGEV
         jUHotE//fXDRwT4H/4KdBxaqZCePltM/EswSlceRxpmd9KInnYOiXmOZPh2J491FfqVz
         4071meA6KKrWv1dgT1vojbqD75DDiqub6C6aiMazg+5cbXL/Hr2U7JJmcBlPAbhb+l9E
         kp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681467171; x=1684059171;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpMSL9mpptWBMKkZ5mf+l7zqDIp0JFzhLiaDWfzh9X8=;
        b=T9A2HAL8FCe+C2NnRU2hckTmIEND7THka75EfBXe6ilk1dwcKwBm0erjzOTbGswrXG
         KwBJF1AOvv1K1kgADn/oCrMv1VDDUFjjuCOaYOlnLXEqoLgYcOEXNOappQNiGyzCm7R8
         ydIkEMxNXX3aqMoxqi6nX55jnEPRo7/o6gEu3R8mUW70I5jFEHg2NM1Fdm9N6nbe7RQF
         wjMAK2mK11+kCyPtPMg5wtfPbIBN0eOqIlGwJVbnNvc+OS8Rt8FByi/W5TQlhiZlCMOY
         kN7uYaakpBW6ifSSYK8RlF+7MF2aDclpK+t7mDa4Ev8ryoSTv0G+8jfkXTRxQl++8Bgx
         Xv0A==
X-Gm-Message-State: AAQBX9dDWZYamQJWM6t6UWuD/VBtqxuDprr1U34phQEw6PVwM/QVCjJz
        2nFuUvK3nVLSxcQAbQnf5McPTfuBzkSWt5JuyjI=
X-Google-Smtp-Source: AKy350ZLCEd53qnU6FCgK6pZDFtBParuu+MbnDYFygCjCg1tVm3sCOWUtXd12mUZOL9rAX+gNp9HqQ==
X-Received: by 2002:a05:6512:21cd:b0:4ec:9c2e:7edb with SMTP id d13-20020a05651221cd00b004ec9c2e7edbmr1936996lft.42.1681467171024;
        Fri, 14 Apr 2023 03:12:51 -0700 (PDT)
Received: from smtpclient.apple (108.224.92.62.static.cust.telenor.com. [62.92.224.108])
        by smtp.gmail.com with ESMTPSA id d15-20020ac24c8f000000b004ec83665aeasm731886lfl.89.2023.04.14.03.12.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Apr 2023 03:12:50 -0700 (PDT)
From:   =?utf-8?Q?Martin_D=C3=B8rum?= <dorum@noisolation.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: [PATCH] media: venus: only set H264_TRANSFORM_8X8 on supported hfi
 versions
Message-Id: <5D1EB136-0839-44BF-9F9B-A937237C9C96@noisolation.com>
Date:   Fri, 14 Apr 2023 12:12:40 +0200
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
To:     stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Setting the H264_TRANSFORM_8X8 property only works on HFI versions
>=3D4xx. The code used to unconditionally set the property in
venc_set_properties, which meant that initializing the encoder would
always fail unless the hfi_version was >=3D4xx.

This patch changes venc_set_properties to only set the
H264_TRANSFORM_8X8 property if the hfi version is >=3D4xx.

Signed-off-by: Martin D=C3=B8rum <dorum@noisolation.com>

---

I have an APQ8016-based board. Before this patch, the Venus driver
would simply fail with EINVAL when trying to request buffers
(VIDIOC_REQBUFS). With this patch, encoding works
(tested using gstreamer's v4l2h264enc).

 drivers/media/platform/qcom/venus/venc.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c =
b/drivers/media/platform/qcom/venus/venc.c
index cdb12546c4fa..b3df805a8c9c 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -672,16 +672,17 @@ static int venc_set_properties(struct venus_inst =
*inst)
 		if (ret)
 			return ret;

-		ptype =3D HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
-		h264_transform.enable_type =3D 0;
-		if (ctr->profile.h264 =3D=3D =
V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
-		    ctr->profile.h264 =3D=3D =
V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
-			h264_transform.enable_type =3D =
ctr->h264_8x8_transform;
-
-		ret =3D hfi_session_set_property(inst, ptype, =
&h264_transform);
-		if (ret)
-			return ret;
-
+		if (!IS_V1(inst->core) && !IS_V3(inst->core)) {
+			ptype =3D =
HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
+			h264_transform.enable_type =3D 0;
+			if (ctr->profile.h264 =3D=3D =
V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
+			    ctr->profile.h264 =3D=3D =
V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
+				h264_transform.enable_type =3D =
ctr->h264_8x8_transform;
+
+			ret =3D hfi_session_set_property(inst, ptype, =
&h264_transform);
+			if (ret)
+				return ret;
+		}
 	}

 	if (inst->fmt_cap->pixfmt =3D=3D V4L2_PIX_FMT_H264 ||
--
2.34.1=
