Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A74B84BA2AA
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 15:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241359AbiBQOM6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 09:12:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241377AbiBQOM5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 09:12:57 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D30628F97E
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 06:12:41 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id p15so7579679ejc.7
        for <linux-media@vger.kernel.org>; Thu, 17 Feb 2022 06:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=U1yOgv7poCocbnO3OcJm1WpJ55ncg461fKj9cpfxJ3s=;
        b=HXAcLL/btOd5QCP2trP4nW78SGdgbwTfE3rD4FciXqSwq5wkKOYfXUpniNJUwfBb9a
         4o3OBV4vEcbIilmMDO9zh45UFE0qTUqoNnZFZEPUtFRqrHSDKLeVKOXeIevJdqDXwq8b
         PWKyZS/9EPqlNRRZ+O3Txq3l1EF0som40TpTrahwEvdFwpfMBp9SWOUZxA7bmiHgQehh
         lYtIzsYZT3t/i+D6CWq+4JUsoxLJ3eY+AEmMeUJZz31q5B91zijy6Yj3DmcfsPzEG/wx
         LZMElWhbwnPDeAu0j4WtwZa85xqpw2oxKmxh6uFTC5fv5dieeVVWJOPTgwYiv049XKJF
         VNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=U1yOgv7poCocbnO3OcJm1WpJ55ncg461fKj9cpfxJ3s=;
        b=Z2L39K/Invmc5yMtCBNkIjt3vpmnq2JgcJIDxcUw7RoMnH9hEP0tx6GlfrnrwAS16d
         xg663x0WBcWwnrGxXzW0gmXIvfSVCaZRw/cQ1wf5XpfNTysveBj+Xlwo+aA0HYP+lDdg
         ffxCb6n5seyKFINIoGTM9JRfBzog7Q4gs2Ij/9AzlirRS+lNqMe4onLV2hkBCOrGppFL
         0cETW195EEfnHYfR+olkBqgE819f+3Q0iYmrdTqiONzZj22V4PxLBnXWe/5oOYLnUXXt
         A/kmc/m724DOAMR9gQxEmcQoxmH0F6FXvHNuBpLhzASGhSFDqjEkj4Tq6OZ4y9tjbNsj
         WeeA==
X-Gm-Message-State: AOAM530WNQmtLFbNv6yVwIalM+tw0diMNdj2LLtIH6gYfjxGN8i7kFV3
        PA3dJ5RK+aPDB19Kj9X2p6Ru7LflGtEn7A==
X-Google-Smtp-Source: ABdhPJww+PstidInoGj+WaaQYURjm4//Nwb419EBXRL71lw5bv1bocguY0dI091tACJTSrZh2a967g==
X-Received: by 2002:a17:907:7704:b0:6cf:48ac:b4a8 with SMTP id kw4-20020a170907770400b006cf48acb4a8mr2427730ejc.305.1645107159992;
        Thu, 17 Feb 2022 06:12:39 -0800 (PST)
Received: from [192.168.1.9] (hst-221-55.medicom.bg. [84.238.221.55])
        by smtp.googlemail.com with ESMTPSA id 12sm1255387ejh.30.2022.02.17.06.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 06:12:39 -0800 (PST)
Message-ID: <b5c170e2-dbdf-fc08-31e2-112d2973017f@linaro.org>
Date:   Thu, 17 Feb 2022 16:12:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Venus v4l2-compliance failures
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Presently we have two failures while running v4l2-compliance on venus
stateful decoder:

1. fail: v4l2-compliance.cpp(753): !ok
        test for unlimited opens: FAIL

2. fail: v4l2-test-formats.cpp(1668): IS_DECODER(node)
        test Cropping: FAIL
   fail: v4l2-test-codecs.cpp(104): node->function !=
MEDIA_ENT_F_PROC_VIDEO_DECODER
        test VIDIOC_(TRY_)DECODER_CMD: FAIL

Failure #1 is related to the limitation we made in decoder open(). The
maximum parallel decoding sessions is limited to 16 and the check
for this maximum is made in decoder open() because the clients wanted to
know that earlier. For example, Chromium browser can open 16 hw
accelerated decoder sessions (in separate Tabs) and from 17 and upward
it will fallback to sw decoder. I wonder how that failure can be fixed.


Failure #2 is related to a commit [1] which add checks for
MEDIA_ENT_F_PROC_VIDEO_ENCODER, I think this entity flag is applicable
for stateless encoders (Request API) but Venus driver has no use of
media-controller API. Did I miss something?


[1]
https://git.linuxtv.org/v4l-utils.git/commit/?id=493af03f3c576fad69c050d33215d1f4fc0d532d

-- 
regards,
Stan
