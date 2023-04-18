Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 073586E5CB1
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 10:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbjDRI6l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 04:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbjDRI6h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 04:58:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 613643AA2
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 01:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681808270;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wstrfXJuxwG/xFo4wXpSjmwUjdz/DEQvD0aCxoaSVC8=;
        b=RG/aYlhcEll1ZqyPxuA5825LxPtvAoRDZyavwalI35I6u661KMNFSZQdAEPXoDIP8IlDXU
        79v4sNPScF5f8BfHMRR0fbaHlKCH5PCAH6dEMnMAU6H9HZD7MMS5pmRevdYrfI4DlEyBGZ
        dtzSDsfT1rv2Rp2qZlqX/i8Ge0mVKjE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-2B7AxxWXOMa2lkvggFRXvQ-1; Tue, 18 Apr 2023 04:57:49 -0400
X-MC-Unique: 2B7AxxWXOMa2lkvggFRXvQ-1
Received: by mail-ej1-f71.google.com with SMTP id cd20-20020a170906b35400b0094f35212aadso2488471ejb.11
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 01:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681808267; x=1684400267;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wstrfXJuxwG/xFo4wXpSjmwUjdz/DEQvD0aCxoaSVC8=;
        b=f/Xho4oHmioNTBkBcetPdYrasPfKzy3n9hWxMh275Mbpz4zvRD+zrxqpG4FfJlXcTt
         HVdm611E3s2sI+10rLTLoB23eLuseZLG6BKJoRvYQCLGjkCBSlZuiYvq5kjlJVp+/Hp1
         VpOMYDMe9RHvxfO1nHrivUVkjO0JWLP9nK7OATzLvAqxsiufgCLWLVSaCqJkf4wz/RE2
         DB1938MVioR3lV+0EiWrqM0g9xqF8uqyBG1KicOJc3frd4VOqJUQi8hQJQ0QqfODYsYW
         JzELCJdkR80x+l91324VPifdRRl/VYik/czDxsSDZS0QMFq0sTeRxxHffmmwTzrUOlWY
         SuJw==
X-Gm-Message-State: AAQBX9fq9hBSw1HqD17sILXTJhk5Lq8YL+m5lw0cYOHVpcdKUdtJRdfQ
        NCIE33h+jIrMeQAQ7DWqfo5mlbGglEeYlp7GmSGpXlRa7440HifIsVNouY8e2hR9yeEfjdosxKV
        ONyhL+fgLMi22tTHw4LvtpiPQP/RAuEI=
X-Received: by 2002:a17:906:fa0f:b0:94a:a887:c29f with SMTP id lo15-20020a170906fa0f00b0094aa887c29fmr10987043ejb.68.1681808267823;
        Tue, 18 Apr 2023 01:57:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zu3Q1/+eExjcsGprhY0hb5M5DHIjVSjeCSbsdIVM5e3pfUFj7r+mGylaorQE1MFR1SY6bZ9Q==
X-Received: by 2002:a17:906:fa0f:b0:94a:a887:c29f with SMTP id lo15-20020a170906fa0f00b0094aa887c29fmr10987034ejb.68.1681808267539;
        Tue, 18 Apr 2023 01:57:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s4-20020a056402014400b00501dd53dbfbsm6763998edu.75.2023.04.18.01.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 01:57:46 -0700 (PDT)
Message-ID: <c726cd9b-1d82-f299-c613-82a8c2e382c6@redhat.com>
Date:   Tue, 18 Apr 2023 10:57:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: atomisp compiler/sparse/smatch warnings
Content-Language: en-US, nl
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <93737d84-cfa0-ece5-4115-afa8ae74299c@xs4all.nl>
 <a71bc016-11e2-f9c8-f2b7-57b55a219360@redhat.com>
 <391fab6c-c247-0661-0389-8ea395ce5957@xs4all.nl>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <391fab6c-c247-0661-0389-8ea395ce5957@xs4all.nl>
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

Hi,

On 4/18/23 10:56, Hans Verkuil wrote:
> On 4/18/23 10:48, Hans de Goede wrote:
>> Hi Hans,
>>
>> On 4/18/23 09:29, Hans Verkuil wrote:
>>> Hi Hans,
>>>
>>> Can you take a look at the warnings in the daily build that are atomisp
>>> related?
>>>
>>> https://hverkuil.home.xs4all.nl/logs/Tuesday.log
>>
>> I'm sick atm, I'll take a look later but it may
>> be a while before I get around to this.
> 
> Beterschap!

Dank je wel.

> I'll take a look at it today/tomorrow, so don't bother with this
> and get better soon!

Great, thank you.

Regards,

Hans


