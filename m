Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11E966DC07C
	for <lists+linux-media@lfdr.de>; Sun,  9 Apr 2023 16:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjDIO5i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Apr 2023 10:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjDIO5h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Apr 2023 10:57:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD3E93A87
        for <linux-media@vger.kernel.org>; Sun,  9 Apr 2023 07:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681052210;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aWNTC+T89/NbS6zEIyzWIViMD3oe9EFAv6DZLT6hMqg=;
        b=YDs5QVCyKP5rfQH9Bi9/AwYP3qFK608l/1Qm6XYXFv29KhkLkG5HfaloempNithVZPbP2H
        dh0hmyYzXSeqZFO6SwQaIWlmtE7TXSomQs4X049fW+xJk3CvDQAen/umdVGfYLCtNBUFX1
        rt9K5WJ4Fs47c8EzUdUxtuxLqFVaFIA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-4av0-MvQNWmdkmWCmn9HgQ-1; Sun, 09 Apr 2023 10:56:49 -0400
X-MC-Unique: 4av0-MvQNWmdkmWCmn9HgQ-1
Received: by mail-ed1-f72.google.com with SMTP id c30-20020a50f61e000000b005047e0a0a24so2854998edn.8
        for <linux-media@vger.kernel.org>; Sun, 09 Apr 2023 07:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681052208; x=1683644208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWNTC+T89/NbS6zEIyzWIViMD3oe9EFAv6DZLT6hMqg=;
        b=RJYulaRJBrET4qiZQHxHa8JKdrEz+zSDHreo+7VRPEkMEA1uT1sIraDCZORIMS2acH
         4lBxXjVwkfDoikv+hDWy/NfCc83Yx78LQJMiiVrhvknWLCYjv2bYyeRklMFLTgdUihJJ
         vMhPeeaEPBJY2c8Nl/37w2a8QWQO/k64HCcj4IlUoQj0VK7mgLa69RLyF25O9qqLnB5s
         c0BSGHCxIJDs9eGj9CxOOBwUkbGaM+8y25Ah4rTl1gF3GEwIqVzCHtDKaoFfBC/lnCSn
         mBJMUEmXj0+shyf8rbsd4CriOeV7l9WEKB9CJD/7sHrJ7FjlljrAn04rgNvv3Sbi6pg+
         6Avw==
X-Gm-Message-State: AAQBX9fEbe7OoK7IvCoc9g4636TksmfpLJkR17ishOZbfreMxaP1H2lV
        P5JgAMQgeLAIG9utoHjfgyiKCjMbLoE+OXJhfe1HR0H09JvwwZc0ZejDl0dJJZ+A1QK8dYYDLhf
        2pBqgTMeR44kkrwM9ZPQe5dg=
X-Received: by 2002:a17:906:da8e:b0:94a:6953:602d with SMTP id xh14-20020a170906da8e00b0094a6953602dmr1581944ejb.37.1681052208342;
        Sun, 09 Apr 2023 07:56:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350bEmGIcVuWdVdKFWpbqG7vZEFVGMkj/QWIm3eoFaBYdVH1h4p7xEjmaUtRtHJmdrdIg1KHdTA==
X-Received: by 2002:a17:906:da8e:b0:94a:6953:602d with SMTP id xh14-20020a170906da8e00b0094a6953602dmr1581939ejb.37.1681052208086;
        Sun, 09 Apr 2023 07:56:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s27-20020a1709060c1b00b009475bd8f441sm4179398ejf.60.2023.04.09.07.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 07:56:47 -0700 (PDT)
Message-ID: <558bf30d-0136-274c-f47a-82ca746ac49d@redhat.com>
Date:   Sun, 9 Apr 2023 16:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [GIT PULL] media: atomisp: Changes for 6.4-1 (#91152)
To:     Jenkins <jenkins@linuxtv.org>, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
References: <20230409141025.1455835-1-jenkins@linuxtv.org>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230409141025.1455835-1-jenkins@linuxtv.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 4/9/23 16:10, Jenkins wrote:
> From: builder@linuxtv.org
> 
> Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/bf274a09-a823-c547-4284-603e8c6da794@redhat.com/
> Build log: https://builder.linuxtv.org/job/patchwork/296238/
> Build time: 00:52:43
> Link: https://lore.kernel.org/linux-media/bf274a09-a823-c547-4284-603e8c6da794@redhat.com
> 
> gpg: Signature made Sun 09 Apr 2023 01:06:41 PM UTC
> gpg:                using RSA key BAF03B5D2718411A5E9E177E92EC4779440327DC
> gpg:                issuer "hdegoede@redhat.com"
> gpg: Good signature from "Hans de Goede <hdegoede@redhat.com>" [expired]
> gpg: Note: This key has expired!
> Primary key fingerprint: A1EA 0673 EAD8 B74F 17D2  B9E1 7C31 E21A 98D2 1E0D
>      Subkey fingerprint: BAF0 3B5D 2718 411A 5E9E  177E 92EC 4779 4403 27DC
> 
> Summary: got 27/39 patches with issues, being 26 at build time, plus one error when buinding PDF document
> 
> Error/warnings:
> 
> patches/0001-media-atomisp-Remove-depth-mode-support.patch:
> 
>     allyesconfig: return code #0:
> 	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
> 	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
> 	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
> 	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:415 ov2680_s_stream() warn: missing error code 'ret'

ret is initialized to 0 and the intend is to return 0 here ...


> 	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3335 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
> 	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3434 atomisp_cp_morph_table() warn: missing unwind goto?

These 2 functions are not changed by this patch, so any problem there is a pre-existing problem.

And the same goes for all the warnings on all the other patches.

Regards,

Hans


