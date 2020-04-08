Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0EB1A2B44
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 23:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730807AbgDHVeR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 17:34:17 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37238 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730784AbgDHVeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 17:34:13 -0400
Received: by mail-lf1-f68.google.com with SMTP id t11so6327691lfe.4
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2020 14:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=i8clFFvhHtURStOSkT8VPHksSoNdpLFd6h/Iv5cyGI4=;
        b=LnInvZrdIwupNbyGWWNiLyou/EL25bZac5eBr3jTVOIfPEW+fE4DypVYwGBMQR/ohi
         fz3GmUoCkoIQWq86bcc0NR4/uLND/ulWi1n90PaOt1C4xNZ0rydmjkToAOnIl6dyh2Qz
         ORP6KVN7HP9MipYbv15xeQf0Khg3Ts99bfLeksOG7tT4GRHGSgpVVlgZnS0zq68BPcJF
         8GECRu1EQDr7ptBiqZBFqJ0J1LgAyLNLoUaiKTExZB6I4iaOzUQCHMKtWKntxWKWxEdn
         ga0+B9sf+h5bikFzqacmy/T/YhwbvTU7Z1FEup/UHx2sqyVAAR1NnkFA7lliMFZ8GnPf
         bp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=i8clFFvhHtURStOSkT8VPHksSoNdpLFd6h/Iv5cyGI4=;
        b=DhaBJNy8GjFhgDE5BHFqNkU96DjwBRMb79/o2eweYB9Kp3NkZQfeBj5XCX1AKLAug8
         bwELxgOhKnUHBY5tNY5D4MKJ4qdxyc/rcYDEmIZJkq7uB8Mr/gIQKL9NOYeeRT5QekA3
         /exS0RC4PE8osmImGCVlX55SND6CWZ2TCsLwUMnt5RinIJVHAbyMI5o7LLRcDlW9VAHn
         V6bcGwCnmjAnIuNUmLysxIsYHfCkTtEE/Q75duYQZyZZBcHfc2CCr989T6JD/+Dm+DwZ
         Ccj+QnvwYRrxmt6M3XwFWfKs6frqp6CwlBc0qBVLhjsuvJUamoP+ZXd2ds4Jt6sV6lmX
         iuHw==
X-Gm-Message-State: AGi0PuY+371l+EYOeIHtkiYMQfTh+J8De2NwXJmJESBxXdTk9uJeZ5Dn
        LNysYR4pVhLCcNipSP6RYUkRdoKO6mI=
X-Google-Smtp-Source: APiQypIafYSBQ7sBXl2z33XJ4IVDpuvO6hb/lUDU0fCXq73HvkPJCCXY3/XQQspt3/SUnsH3GZurEQ==
X-Received: by 2002:ac2:4da7:: with SMTP id h7mr5216375lfe.95.1586381651346;
        Wed, 08 Apr 2020 14:34:11 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-138.ip.btc-net.bg. [212.5.158.138])
        by smtp.gmail.com with ESMTPSA id t6sm15746688lfb.55.2020.04.08.14.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:34:10 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 6/7] venus: vdec: Init registered list unconditionally
Date:   Thu,  9 Apr 2020 00:33:29 +0300
Message-Id: <20200408213330.27665-7-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200408213330.27665-1-stanimir.varbanov@linaro.org>
References: <20200408213330.27665-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Presently the list initialization is done only in
dynamic-resolution-change state, which leads to list corruptions
and use-after-free. Init list_head unconditionally in
vdec_stop_capture called by vb2 stop_streaming without takeing
into account current codec state.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 5823537b3131..f23cbd812ef4 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1072,13 +1072,14 @@ static int vdec_stop_capture(struct venus_inst *inst)
 	case VENUS_DEC_STATE_DRC:
 		ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT);
 		inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
-		INIT_LIST_HEAD(&inst->registeredbufs);
 		venus_helper_free_dpb_bufs(inst);
 		break;
 	default:
-		return 0;
+		break;
 	}
 
+	INIT_LIST_HEAD(&inst->registeredbufs);
+
 	return ret;
 }
 
-- 
2.17.1

