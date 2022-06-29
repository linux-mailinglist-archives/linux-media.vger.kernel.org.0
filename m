Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D47685609E3
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 21:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbiF2TAl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 15:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiF2TAk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 15:00:40 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 633E31D337
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 12:00:38 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 93-20020a9d02e6000000b0060c252ee7a4so12834871otl.13
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 12:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XANCxfETU1X+90CB+8QdrHZuxUsMStZ7sxeiI78YWI0=;
        b=Pfi9XaRsdMVzmFoS8g4bijGAdYLPNiZX5G2nLuIu+FFApiFDqftIhy0m2ToaU/zKgL
         Np8DdYrPLPygnuYrZxtb3DNMF4AZGmEepH1j3a8CAB80u+Ldpm/E4wheDB9QxfIQopD/
         ZgJVV9JeT3mCpx7VPCUG4vVd+gHe10sRnQKSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XANCxfETU1X+90CB+8QdrHZuxUsMStZ7sxeiI78YWI0=;
        b=EHt87LbbIyvJhVN3CukBOgIgsSQ6tcpYvHn2vK5B1SExdoQgVwBbOmU7fGLnrJNyXR
         ACc7hwpf9VARGnXDeunrd6GiIIYjyK8eMYa3Ceen+7dM8+77SvIxh9bWlccwwimdQyC3
         qCBXPJ8o04iuNVcd5aAF4NcslHbTwQqEfShEWeyUqtaWfsmOg8f06NjhF+4KWXPVJ3fc
         WQmhh4jW+maSuTrzE44huyFflKx2c4w4bGTQUJ4jWjkSq28mOGWxgbTmvLtu3UhTdBKp
         TWgR5k/DJ8zIIWGw+DjJqYCCijUgmkFnyN2YyjuaniWZ0AbrPwbFxEHyhgrK4kbjfp1m
         cCXQ==
X-Gm-Message-State: AJIora/Wun3BXaULSsoQ3jR8Q5aU14Ey7asV2RHM10ty64xGXsteNkU9
        AL40BiZiM24gkvGZnOpKLDT2lQ==
X-Google-Smtp-Source: AGRyM1tjw49FI5kz2aRYhahxfht0fnwCbdGiJkQjKsHkxkmAzOKYpE5XAUMOZGVS7kV98l4pMV2e1A==
X-Received: by 2002:a9d:2f42:0:b0:616:eb86:e8b4 with SMTP id h60-20020a9d2f42000000b00616eb86e8b4mr2210163otb.333.1656529237497;
        Wed, 29 Jun 2022 12:00:37 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id j4-20020a4aa644000000b0035eb4e5a6besm9589897oom.20.2022.06.29.12.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 12:00:36 -0700 (PDT)
Subject: Re: [RESEND PATCH v3 2/2] media: vimc: documentation for lens
To:     Yunke Cao <yunkec@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220629020630.2865785-1-yunkec@google.com>
 <20220629020630.2865785-3-yunkec@google.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <b4943a26-e8b4-0f78-bfb9-e6e018537f28@linuxfoundation.org>
Date:   Wed, 29 Jun 2022 13:00:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220629020630.2865785-3-yunkec@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/28/22 8:06 PM, Yunke Cao wrote:
> Add documentation for vimc-lens.
> Add a lens into the vimc topology graph.
> 
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
This patch is now queued for vimc pull request for Linux 5.20-rc1
to be send to Mauro Chehab.

https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/log/?h=vimc

thanks,
-- Shuah
