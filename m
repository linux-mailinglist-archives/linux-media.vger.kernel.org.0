Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 855E06A0529
	for <lists+linux-media@lfdr.de>; Thu, 23 Feb 2023 10:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233374AbjBWJow (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Feb 2023 04:44:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234073AbjBWJor (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Feb 2023 04:44:47 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A657D3028E
        for <linux-media@vger.kernel.org>; Thu, 23 Feb 2023 01:44:45 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id k37so5260969wms.0
        for <linux-media@vger.kernel.org>; Thu, 23 Feb 2023 01:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00RxSg5iqgcnbHskrlCdjttzDFTRa5ds6mHpBpdH+LE=;
        b=fBveMGs3JFDKixNptruplhzLPALTOqSKeRxLJe0jsK25BPwZvex1Gi7VEvixhjbXrJ
         uLHdHxT2KhMBcfEQ1zf74X4+SKlNU+U36+uMPXQSmVYCMuCvmrQxp/HtgvVNYFJ/MZIK
         TxnYMA69OkN3W2odaeAriOhh+gTB5VH1c4MOlZ4BO1lVWAVJFX9TS00/G5swy7DCzD9d
         6ZcBMiPO78rKkUnCP2T5N+ldRxMKVzA1SQWakXdq4m2BUTI9OsuQptnsZ4/L8wguUCv0
         j9YyHFp0LsWjye2Ug+Hv89EIMyVwfk1FVnskGj6vh1E3uP2+pabr9Oy7HcWuBUIIa20O
         O1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=00RxSg5iqgcnbHskrlCdjttzDFTRa5ds6mHpBpdH+LE=;
        b=HbCWnDCOwTMfcYF5zUPpVCWeUVI2EJJGeyDzYOnbbXjDPlt7PArY/0GUiIU7HwguSA
         phwbCbDnRdDiDywjEjxGbm8Istjrr8mDKKrHCvPAaanLN7FWulYYGyGYdLDW9rSaKz6F
         uQ/BFgcnaejAbbhkADfI9e+3lboKOVhqXrRTvZOeT4NgjMssk7jatFVEr1iE4V+4cAiF
         r9Lm8MpoA+lDfm7QLaVXUp6zi2APNeyeP8sOkEWWKflzKKFwxrM0z5DsqveP68JP6zNa
         ouVeyfJZZuKHzdrRxASUtoTLFJlxUyJc8IOjXtr+NfpUct2NAaBQ+Y/sQ8xbudnPxvH8
         3AKg==
X-Gm-Message-State: AO0yUKXqL69/nTXne5GgG/yUgvb/1eT2ie/fv7jfvKW9qOMF6qk/vNd4
        Wk6bTI2K1icQL9sLlyouBSVd3AUPeSHl6BRf
X-Google-Smtp-Source: AK7set/m3zFPM5QczDX4tabA9jdCsOnEz1ubnc/mmPGT+WN1zsCTYeb6Mqbqwclm53B4EVUodFrFMg==
X-Received: by 2002:a05:600c:3093:b0:3dc:5c86:12f3 with SMTP id g19-20020a05600c309300b003dc5c8612f3mr2814573wmn.1.1677145483930;
        Thu, 23 Feb 2023 01:44:43 -0800 (PST)
Received: from [10.228.210.75] ([94.135.112.238])
        by smtp.gmail.com with ESMTPSA id o27-20020a05600c511b00b003e21dcccf9fsm11917103wms.16.2023.02.23.01.44.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 01:44:42 -0800 (PST)
Message-ID: <86f5a2f0-0714-6648-eed2-cd4f11209dd5@googlemail.com>
Date:   Thu, 23 Feb 2023 10:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Gregor Jasny <gjasny@googlemail.com>
Subject: v4l-utils 1.24.0 has been released
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I'm happy to announce that v4l-utils 1.24.0 has been released. This will 
be the last version before the build system will be migrated from 
Autotools to Meson.

Changelog: 
https://git.linuxtv.org/v4l-utils.git/tree/ChangeLog?h=v4l-utils-1.24.0
Download: https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.24.0.tar.bz2

Thanks,
Gregor
