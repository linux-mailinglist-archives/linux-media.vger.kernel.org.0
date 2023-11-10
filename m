Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85ADC7E764B
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 02:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345553AbjKJBE5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Nov 2023 20:04:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233763AbjKJBE4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Nov 2023 20:04:56 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF193AA7
        for <linux-media@vger.kernel.org>; Thu,  9 Nov 2023 17:04:54 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-407da05f05aso10126165e9.3
        for <linux-media@vger.kernel.org>; Thu, 09 Nov 2023 17:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699578293; x=1700183093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBeLT8khJaQLixVgfl4LSRyi0x5wnZw3atoglLJt33I=;
        b=YOSW+L+fMiXOUL3vaWFzjaTOzh+9TE64dV1xxBbmCgfMNLNpqduSOoYq11RwlmkC2I
         g2W5F9q154NZzKAHvow+ukRKo/+WzcIhjlWMqJjksZ8AglK9IjrJWeGhvlENJrMzYtEF
         TuwTDUxC8kKI0PVdnCiapVUzP834OR5RHWn9uDbjHtqHrOhr6HBRwjNh0k23WtgoWqQ6
         gnGw6vMS7euftbObreSw88hQ6IuOe42pfQv5s5bx9m6l+8HPcWnHhOiL3cHLR6+Y31LX
         GkV+M2E5OMgKKt/uxnu8b/SnDm8KrjUPJkJ+lvAcu7VTayZqZ/Ncv1o8ZW3NwQngDviB
         RClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699578293; x=1700183093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBeLT8khJaQLixVgfl4LSRyi0x5wnZw3atoglLJt33I=;
        b=pAhsf+DckInobLLBoAv93e7D8YMx/tgRcK1YIua+UcPw9tFOrjjk0PE4bQSUKGPXI6
         mtla4yMoZ4HKqyx32VYWBy/aKb01P3KNBka8KRJkgWGn5J7OHV+e11+PKKV9MhQ6JHmt
         su/K2WosLCVrEuiuEcrYAfzoZmfAffsa5w5YzXmeH7nrUQFtqr+7CG/71Rek7CFrZNHj
         qMc1P96Sf09nfuGbRVUzVNHBAFgFNo/IbZlAaz5DcXrpMTIxsQ/OLuOwZZiYaT0kAIfQ
         qvBMWjZGrQdaxpYhEDVzRsYr5gxghbt0oZgIlvKyEvp1SiwJAkM8jMy4pnzFyKq2D8LY
         XT3w==
X-Gm-Message-State: AOJu0Yzg4RPpTj5YkOKmJSoU8CTeL0W5HelOOYH6Mqte91I1BV79mlmS
        p29cesGcT/f7n7tg8rikZZpScheDR5SXfnDraUns8w==
X-Google-Smtp-Source: AGHT+IGSsehKg1MV6Gko9IAhZKt363sva3uyfgouhqLdN6o31S/mQFPVZ+Q5YqSbangHdJ1GwPJIog==
X-Received: by 2002:a05:6000:70b:b0:32d:a13e:acce with SMTP id bs11-20020a056000070b00b0032da13eaccemr7013527wrb.13.1699578292887;
        Thu, 09 Nov 2023 17:04:52 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id d1-20020a056000114100b00326f0ca3566sm820562wrx.50.2023.11.09.17.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 17:04:52 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Fri, 10 Nov 2023 01:04:47 +0000
Subject: [PATCH v5 2/6] media: qcom: camss: Add CAMSS_SC8280XP enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231110-b4-camss-sc8280xp-v5-2-7f4947cc59c8@linaro.org>
References: <20231110-b4-camss-sc8280xp-v5-0-7f4947cc59c8@linaro.org>
In-Reply-To: <20231110-b4-camss-sc8280xp-v5-0-7f4947cc59c8@linaro.org>
To:     hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
        matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds a CAMSS SoC identifier for the SC8280XP.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index a0c2dcc779f05..ac15fe23a702e 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -77,6 +77,7 @@ enum camss_version {
 	CAMSS_660,
 	CAMSS_845,
 	CAMSS_8250,
+	CAMSS_8280XP,
 };
 
 enum icc_count {

-- 
2.42.0

