Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B01B6919E6
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 09:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbjBJITd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 03:19:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbjBJITb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 03:19:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C36657740
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 00:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676017123;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=iVtYqaaQ7dSvGBX/UdCn76+kv/o4oHmMd0gDTcWP1xU=;
        b=XBPhjvGPU062MqLRiT2rk64/V/rEkVY1o/LUi/67UQN9yHDkFWsfWPIui2h0z/31qLP3+0
        bwyeQrne9iZS7BhvL+pnIQF3TBBYKTGb3Hu4T/cK1kmqmB1kr12mNHYB7JEBu6YjWWwmRm
        sUb2iQT198aPkBTQXopieBDQmDAMaK0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623--i0ykE_AMXu3Djq5FJCEOQ-1; Fri, 10 Feb 2023 03:18:42 -0500
X-MC-Unique: -i0ykE_AMXu3Djq5FJCEOQ-1
Received: by mail-wm1-f70.google.com with SMTP id r14-20020a05600c35ce00b003e10bfcd160so2205931wmq.6
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 00:18:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVtYqaaQ7dSvGBX/UdCn76+kv/o4oHmMd0gDTcWP1xU=;
        b=G1X+H3ZjKPfL1LHfwlJK21aymv/dSmzpL/fOHbSNTyDbFj95kOp77sHRVXvIjhUCeW
         ivLldGIBTzGqrGoSDxfSgFrj9vxPkbKkf9eri6wJ++4NqKnuxkgWBcdtLbY3fwJ+5Ey8
         dOCVIJsZC3geQdHBGF7J2LFG8RoeT2HGfjQnKKUzJAr/9MP6D8Qc5toOlmY84Q5Y9KyW
         sr80nOaE7Hm22nHxuuCuX1OiUB1bMyUKaa3R+9Xwlo6KuLJ+I2EqlGK/pk0HuSjxNvW2
         pFKcYik8R7yEScODEjeLO27QNR/d/pfbNZQlFKTYDL0YedfcDDbFAQ5zcF6ITf7G9OpH
         Bd8Q==
X-Gm-Message-State: AO0yUKVk11UUCdByB64q5KF4SM2CSDswKi37MscHnQOtwXwRW4glaEkD
        Sfe1R2aI93aIcX0TGX+0srRPkwmGKXdNI34be85BoJ7jTAbdMSTXUVFm7mlN1fZhqHT73PT+pom
        O6Jz2Ce2YdcqKR+4ejw1TRoI=
X-Received: by 2002:a05:600c:2e95:b0:3dc:57e8:1d2f with SMTP id p21-20020a05600c2e9500b003dc57e81d2fmr12059801wmn.9.1676017120961;
        Fri, 10 Feb 2023 00:18:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9Q3oBwvFntO43xljuvGD2h+gQvZoyDcaXC4CisWZmH4Hrr8bdy9JeF5Zs/6Zg1hnqFXvZoDQ==
X-Received: by 2002:a05:600c:2e95:b0:3dc:57e8:1d2f with SMTP id p21-20020a05600c2e9500b003dc57e81d2fmr12059788wmn.9.1676017120804;
        Fri, 10 Feb 2023 00:18:40 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t8-20020a05600c2f8800b003ddf2865aeasm7624944wmn.41.2023.02.10.00.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 00:18:40 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Albert Esteve <aesteve@redhat.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Sergio Lopez <slp@redhat.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] media: venus: dec: Fix capture formats enumeration order
Date:   Fri, 10 Feb 2023 09:18:35 +0100
Message-Id: <20230210081835.2054482-1-javierm@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 9593126dae3e ("media: venus: Add a handling of QC08C compressed
format") and commit cef92b14e653 ("media: venus: Add a handling of QC10C
compressed format") added support for the QC08C and QC10C compressed
formats respectively.

But these also caused a regression, because the new formats where added
at the beginning of the vdec_formats[] array and the vdec_inst_init()
function sets the default format output and capture using fixed indexes
of that array:

static void vdec_inst_init(struct venus_inst *inst)
{
...
	inst->fmt_out = &vdec_formats[8];
	inst->fmt_cap = &vdec_formats[0];
...
}

Since now V4L2_PIX_FMT_NV12 is not the first entry in the array anymore,
the default capture format is not set to that as it was done before.

Both commits changed the first index to keep inst->fmt_out default format
set to V4L2_PIX_FMT_H264, but did not update the latter to keep .fmt_out
default format set to V4L2_PIX_FMT_NV12.

Rather than updating the index to the current V4L2_PIX_FMT_NV12 position,
let's reorder the entries so that this format is the first entry again.

This would also make VIDIOC_ENUM_FMT report the V4L2_PIX_FMT_NV12 format
with an index 0 as it did before the QC08C and QC10C formats were added.

Fixes: 9593126dae3e ("media: venus: Add a handling of QC08C compressed format")
Fixes: cef92b14e653 ("media: venus: Add a handling of QC10C compressed format")
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/media/platform/qcom/venus/vdec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4ceaba37e2e5..bb14bea9fe09 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -31,15 +31,15 @@
  */
 static const struct venus_format vdec_formats[] = {
 	{
-		.pixfmt = V4L2_PIX_FMT_QC08C,
+		.pixfmt = V4L2_PIX_FMT_NV12,
 		.num_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
 	}, {
-		.pixfmt = V4L2_PIX_FMT_QC10C,
+		.pixfmt = V4L2_PIX_FMT_QC08C,
 		.num_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
-	},{
-		.pixfmt = V4L2_PIX_FMT_NV12,
+	}, {
+		.pixfmt = V4L2_PIX_FMT_QC10C,
 		.num_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
 	}, {
-- 
2.39.1

