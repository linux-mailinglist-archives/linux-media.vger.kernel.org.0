Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB4A26FBE7F
	for <lists+linux-media@lfdr.de>; Tue,  9 May 2023 07:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbjEIFJR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 May 2023 01:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjEIFJQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 May 2023 01:09:16 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51AE97DA3
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 22:09:15 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-51f6461af24so3814100a12.2
        for <linux-media@vger.kernel.org>; Mon, 08 May 2023 22:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683608955; x=1686200955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lNQEwvBW/LNL8nSQHYklRWv44pqA72uMlUuwzE53gDk=;
        b=n7PUL3xw1NdEm7QTbOQWMFNDpYkcbfIhRt+/Ofp2yKjFrd2sFe+M6ta0J1QRM7K3It
         NuPmymi+uoinqg9F2ikL9uTZhtlIQ34wprxpHhskfjmBaCS6e+QH6llICmyRAu73LaIn
         CgqaxCZnxhZgo7tIX4W20qteYcCQR7mUsKvck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683608955; x=1686200955;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lNQEwvBW/LNL8nSQHYklRWv44pqA72uMlUuwzE53gDk=;
        b=hNDguVEoriX/7yZETVIHuc502/Vyu0Rsh2FnGexCP+erBSC9o9VPya2xHEnf7Ms0Dx
         rdLCfAoOiT48RrpNKuZ5Vg6srvJXdz04hMZdRidPxK9tjJJLIm06CNWDjIin1O/FCEi9
         Qgb2vndmyxwO12+GOJZH3/AbxB9iKGXHfY0A5TCYzD3FJVcB491hursQCGpBSLbDy6yS
         yZB6mM9gA/+DXBV26vi4XD3GPZPnu39615Cl+PNPYLqnujdZ8tYAmdiqB9X+HEHCiG4O
         M6jsSnaGXoRycGoxEg1Ap8S6ZHF0yu8C3bZRMx9C1+ISGIEjYlhIC9YCPfBAp/mqkDkM
         /YhQ==
X-Gm-Message-State: AC+VfDxcF3aHkLsfNJuFLX0f44qWgE1MZxm4y93izaC+H7reddLrmJWD
        2d3+4Qn7QR3NdZtC00gG7+ZQbA==
X-Google-Smtp-Source: ACHHUZ4qSSSec2rolj/kRwy3CT7BcqGRVJlP7yG9XY+Rkrd2FfK4G3AUCwp7mFrxg6V70Y/Tec1ucA==
X-Received: by 2002:a17:903:182:b0:1ac:8be5:8787 with SMTP id z2-20020a170903018200b001ac8be58787mr3879834plg.21.1683608954815;
        Mon, 08 May 2023 22:09:14 -0700 (PDT)
Received: from ?IPV6:2401:fa00:8f:203:5b49:c0b4:4f69:b76c? ([2401:fa00:8f:203:5b49:c0b4:4f69:b76c])
        by smtp.gmail.com with ESMTPSA id b9-20020a170902650900b001a6dc4f4a8csm450131plk.73.2023.05.08.22.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 22:09:14 -0700 (PDT)
Message-ID: <310b789c-ae2e-7306-267e-8bf508211b60@chromium.org>
Date:   Tue, 9 May 2023 14:09:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1] media: vivid: Extend FPS rates offered by simulated
 webcam
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>,
        Yunke Cao <yunkec@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
References: <20230414072419.1397808-1-mstaudt@chromium.org>
 <0ed5d350-85f6-967f-5ff9-270e50bb0f3a@chromium.org>
 <e0dd9182-0638-b616-d09b-a2b031513c19@xs4all.nl>
From:   Max Staudt <mstaudt@chromium.org>
In-Reply-To: <e0dd9182-0638-b616-d09b-a2b031513c19@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 4/21/23 16:17, Hans Verkuil wrote:
> On 21/04/2023 09:07, Max Staudt wrote:
>> Is this patch close to what you had in mind when you suggested updating the simulated webcam parameters in vivid?
> 
> Yes, that makes sense.

Hi Hans,

Quick ping on this patch.

Are you still interested in upstreaming an updated FPS table?



Thanks,

Max

