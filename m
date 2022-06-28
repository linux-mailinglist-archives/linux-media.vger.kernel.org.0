Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C49BC55EF76
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 22:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232486AbiF1UVw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 16:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbiF1UV2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 16:21:28 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754C51055A
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 13:19:17 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-101dc639636so18563535fac.6
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 13:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ffmGpu8lcBy732Yk8UHhROTWkBhCmV9KGHp9cpeZHLA=;
        b=sdI3ZUdRAHHVE8/wQfFVoULz3rY1/eCdO+vvQ3F7p3sAbpr6rHigx3+PG9NfuiyqV2
         E97mndzUHIqIO8lH34KVWzKQGSRnnjjcKrroTzWl4F/5ZlLeJlHABX7Lq7HMh9Kq2Nfl
         dN66zDKhzLJpn4O9789H5y04a259o5vmpMZ9xw0xpn7DJsNqKdk+1c6a5A8QsSbhPbKT
         JRKxC999b1rgJWCHnWRsz2IIeoYbNy0/0h/4UMMiseRKUEJHkdP91hhybRz5sbKqZJDA
         WOuvdHizBu6OCVLVs97xPWz2YF1TTAVq8N+v9qD6cSyTVSHkofT5sIzhpGHl8EFQd0ns
         xr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ffmGpu8lcBy732Yk8UHhROTWkBhCmV9KGHp9cpeZHLA=;
        b=xXRHMH3WVaVbdHrD7R1bPmBHCXk+8L0J3qxr9zAb2zp1C/dg5EsZnZSjuqv13fzkVu
         y1G6nn3cQJEEUsV3LaxtFmxXwwCf/KHgc+2Frd9sPL6Kpx27L9sfboqXgMno7RP1fwFt
         mYeO4Buj/wC0+9zDy4c3xYCK6z/yXSWr6H6JEucmBXo5ehA3Fpxm/3ZYPbnT6CEy7FF9
         bSemq2u9KK+kcr+UrEGUug7pHQgI7CWicUaAolU8KUSo6w5rSs/hRK3qtUyuP/iKBU/4
         LINmaTUNNPiUe7dJXnuJwzW5XuxKWHGplLZqU9QY2jPLkZmTxWO88ZfhE6/Iaz7zOxst
         BAYQ==
X-Gm-Message-State: AJIora/rYnIAIzqsQXsPfugfqCtzpnb4DzftR7gwB/jUN4BfDlxzmQDR
        p+LVfVi6DsTbscGKBTEphlfypgxiEYWvdw==
X-Google-Smtp-Source: AGRyM1uTQQ2KoLG26Y8RnJhozVXkKtEORXk+Ro4fTTJ7srHBYCflhtHp1c5ieKZR/q5bUIfJbdPP+g==
X-Received: by 2002:a05:6870:580b:b0:f1:8489:343e with SMTP id r11-20020a056870580b00b000f18489343emr852863oap.298.1656447556812;
        Tue, 28 Jun 2022 13:19:16 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a12-20020a056870d60c00b000f30837129esm9536923oaq.55.2022.06.28.13.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 13:19:16 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, mchehab@kernel.org,
        hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        robert.foss@linaro.org
Cc:     hfink@snap.com, andrey.konovalov@linaro.org, jonathan@marek.ca,
        dmitry.baryshkov@linaro.org, jgrahsl@snap.com,
        vladimir.zapolskiy@linaro.org, agross@kernel.org,
        todor.too@gmail.com
Subject: Re: (subset) [PATCH v3 0/8] camss: Fixup multiple VDDA regulator support
Date:   Tue, 28 Jun 2022 15:18:52 -0500
Message-Id: <165644753306.10525.8589449831598361545.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
References: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 11 Jan 2022 12:52:04 +0000, Bryan O'Donoghue wrote:
> V3:
> - Adds Robert's R-B for 7/8 patches
> - 5/8 should be a NOP, for the sake of procedure left out Robert's RB
> 
> V2:
> - Only do array allocation when num_supplies > 0 - Bjorn
> - Set unused regulators to {} instead of { NULL } - Bjorn
> 
> [...]

Applied, thanks!

[3/8] arm64: dts: qcom: sdm845: Rename camss vdda-supply to vdda-phy-supply
      commit: 11c83450ff1157d31acbbff4d236d9787929c4c5
[4/8] arm64: dts: qcom: sdm845: Add camss vdda-pll-supply
      commit: f424d754212ae976dcbea997d5699fe508b737d9

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
