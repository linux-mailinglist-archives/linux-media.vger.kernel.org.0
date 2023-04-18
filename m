Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5C0A6E5C78
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 10:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbjDRIto (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 04:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbjDRIth (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 04:49:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 335E39010
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 01:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681807690;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=x16Pk6BM0OAIyh2BpbvwINN0ZsdrThEtFTXwwep6++0=;
        b=MR+WjeLT5NGoQeE05+jrghZhmpYsyAkHRRZN/K/etGFIAkEWOwZZYavIhpvfInUhB2z250
        LjLu0ItUc6EADZETGF2mXVXR+lU1ZGjVnEL8pENSECBHp5bKQeb/OiSamJTors4Pi6zZtz
        DespbK6AduTbkSWkk6R8Wj9n+NvpWwU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-Td3Wd69fNv6sKa6k9PKNXA-1; Tue, 18 Apr 2023 04:48:09 -0400
X-MC-Unique: Td3Wd69fNv6sKa6k9PKNXA-1
Received: by mail-ej1-f71.google.com with SMTP id kr13-20020a1709079a0d00b0093be92e6ff4so10075173ejc.23
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 01:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681807687; x=1684399687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x16Pk6BM0OAIyh2BpbvwINN0ZsdrThEtFTXwwep6++0=;
        b=O0aaT9HwsaNlZpr4EW1f1HMdA2cV0FizYko6raX6QEih8WU0Hq3/sWsWTBRR9n5Ud1
         FT//dMXMvVaOOUHBgKsh7JVp3ttczlRRtNi769LUpLUYecFwETWl4pY2mKhctgFT+51B
         AtqwlOs0TV73igGn+6yn+0YyYNN6McDuR6m60jnlJ/02wiaVcmydFxBGGX+SOM+hlByB
         328SaikUShsj3GzxfQQCPkUvw8ircdv/yb+1XWxTtVLOlHFAWcEIxE1Yj6mSSQEHoiYz
         xLCuxZzU3hGNSQNRbEZ2tK6mPMqBzpk6hcgNAUG4pourPYImefcJs4Vdlc8cdP3v188F
         dPvQ==
X-Gm-Message-State: AAQBX9eDhlAzCYdPq/dD+/VJQOxHF6bCgjZI4CW0EqO7WBoRS4NwYUHD
        HhEzSl42wIlKKJVLuoP13x+4NXBsXRlHZbARNhpf2qnfa3rCt/SLgKnhdw87LzzK0fbW2V4AneM
        Pa65kCQTcL1f3fJz/io2iO5b+PhDC7H4=
X-Received: by 2002:a17:907:9849:b0:94e:ef4d:8937 with SMTP id jj9-20020a170907984900b0094eef4d8937mr9535594ejc.57.1681807687443;
        Tue, 18 Apr 2023 01:48:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZTcA1XFfoiHS7hRRTeziU1wR2DezuBePKY9313I6yeKONvAK9CW34D2HYu7LuCV1pkli9NJw==
X-Received: by 2002:a17:907:9849:b0:94e:ef4d:8937 with SMTP id jj9-20020a170907984900b0094eef4d8937mr9535584ejc.57.1681807687096;
        Tue, 18 Apr 2023 01:48:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h7-20020a170906584700b0094e597f0e4dsm7674596ejs.121.2023.04.18.01.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 01:48:06 -0700 (PDT)
Message-ID: <a71bc016-11e2-f9c8-f2b7-57b55a219360@redhat.com>
Date:   Tue, 18 Apr 2023 10:48:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: atomisp compiler/sparse/smatch warnings
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <93737d84-cfa0-ece5-4115-afa8ae74299c@xs4all.nl>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <93737d84-cfa0-ece5-4115-afa8ae74299c@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 4/18/23 09:29, Hans Verkuil wrote:
> Hi Hans,
> 
> Can you take a look at the warnings in the daily build that are atomisp
> related?
> 
> https://hverkuil.home.xs4all.nl/logs/Tuesday.log

I'm sick atm, I'll take a look later but it may
be a while before I get around to this.

Regards,

Hans




