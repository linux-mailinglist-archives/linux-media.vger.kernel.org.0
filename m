Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD12E1EB178
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 00:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728817AbgFAWDs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jun 2020 18:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728488AbgFAWDr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jun 2020 18:03:47 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 561F5C08C5C0
        for <linux-media@vger.kernel.org>; Mon,  1 Jun 2020 15:03:47 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id v24so482019plo.6
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2020 15:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XFnIQB7ncVF63T1pY2NMmD5MUjtRKH/Cyt/vduuOCr4=;
        b=fek/fKkwjOdhsv+J8geTqfhekmIfVg31GBFgDaJGfViiSS3F/TsrEDBUE9wVv/9R8E
         SLECz+XjlLL63WPLyFxiSgONAHsFBoColGWxAzWM9st+Pt4+fuDZvusd10ecebte6xxm
         cZP+Te8MKz3ySAe3gVd2jr865slvk2yVvi9Hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XFnIQB7ncVF63T1pY2NMmD5MUjtRKH/Cyt/vduuOCr4=;
        b=NWu/lNhUoIPc41e++yM2ZBPsxoPYnw2bQKyHVY/r+XnEIAwZfmyNs/brljJgR/XXzC
         YQYp68/fnkR4dkfFsEE13EjKvNjGtZu/JCCFbHHUa3AW/FNGkOcsJva8qmy5bhx57i9i
         Lp+uHJm6ud1TFwDONpMuDSeXIGm6ayPisZ8jWfzVYGtaiXuyFwtlsxwdLXKBX0Zy9G7r
         Mg4zMBG/W9JMR6aX94bioLxZi0gJ8tovXS+zDk67hM2yjdexX+ClQcvKOGoCRbiPG54V
         joG1ls+lnRi+dK0u2FAYRijUVH67JAQ+KWHU4nMY5uI8Rbfdf9YpMzy8IEeFCs3N37PK
         qb/g==
X-Gm-Message-State: AOAM531rOZ8AAdLvxi2Vm5M1uOaulZtezNZTbLB81VSFRRRS9PdtBeoq
        UmiCqGKsMPMA6OtZtAy8ncQi5A==
X-Google-Smtp-Source: ABdhPJweeLR8G4rZkKaY74PZV+ncoWYY84wN8268AueoBMTYcuSWzeDoqapxC9otqNOiOJ4igNbeRg==
X-Received: by 2002:a17:902:7041:: with SMTP id h1mr22988066plt.169.1591049026875;
        Mon, 01 Jun 2020 15:03:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 67sm346948pfg.84.2020.06.01.15.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 15:03:46 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     amasule@codeaurora.org, stanimir.varbanov@linaro.org
Cc:     swboyd@chromium.org, jkardatzke@google.com, mka@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [RFC PATCH] media: venus: Fix NULL pointer dereference in core selection
Date:   Mon,  1 Jun 2020 15:03:22 -0700
Message-Id: <20200601150314.RFC.1.I1e40623bbe8fa43ff1415fc273cba66503b9b048@changeid>
X-Mailer: git-send-email 2.27.0.rc2.251.g90737beb825-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The newly-introduced function min_loaded_core() iterates over all of
the venus instances an tries to figure out how much load each instance
is putting on each core.  Not all instances, however, might be fully
initialized.  Specifically the "codec_freq_data" is initialized as
part of vdec_queue_setup(), but an instance may already be in the list
of all instances before that time.

Let's band-aid this by checking to see if codec_freq_data is NULL
before dereferencing.

NOTE: without this fix I was running into a crash.  Specifically there
were two venus instances.  One was doing start_streaming.  The other
was midway through queue_setup but hadn't yet gotten to initting
"codec_freq_data".

Fixes: eff82f79c562 ("media: venus: introduce core selection")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I'm not massively happy about this commit but it's the best I could
come up with without being much more of an expert in the venus codec.
If someone has a better patch then please just consider this one to be
a bug report and feel free to submit a better fix!  :-)

In general I wonder a little bit about whether it's safe to be peeking
at all the instances without grabbing the "inst->lock" on each one.  I
guess it is since we do it both here and in load_scale_v4() but I
don't know why.

One thought I had was that we could fully avoid accessing the other
instances, at least in min_loaded_core(), by just keeping track of
"core1_load" and "core2_load" in "struct venus_core".  Whenever we add
a new instance we could add to the relevant variables and whenever we
release an instance we could remove.  Such a change seems cleaner but
would require someone to test to make sure we didn't miss any case
(AKA we always properly added/removed our load from the globals).

 drivers/media/platform/qcom/venus/pm_helpers.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index abf93158857b..a1d998f62cf2 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -496,6 +496,8 @@ min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load)
 	list_for_each_entry(inst_pos, &core->instances, list) {
 		if (inst_pos == inst)
 			continue;
+		if (!inst_pos->clk_data.codec_freq_data)
+			continue;
 		vpp_freq = inst_pos->clk_data.codec_freq_data->vpp_freq;
 		coreid = inst_pos->clk_data.core_id;
 
-- 
2.27.0.rc2.251.g90737beb825-goog

