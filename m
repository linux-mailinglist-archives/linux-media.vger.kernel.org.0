Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFD16A5CB8
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 17:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbjB1QEh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 11:04:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbjB1QEg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 11:04:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 517C41E5F3
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 08:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677600228;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZWMAworI50CQabTilrteqDasDy+XoVkceugkq8E6Pr8=;
        b=cR1NKl5h5NJkSkgQp8NmU7oFXUZV3AKoEQdq+73YQARR3sWRHuXvi96W+z0oMoxJkTfeiu
        sVHxgqcypWkD/acnWgGFrFBmvPTqwDA8Ow4EUKxmUIShhsziWxTUMD+hHVkuQHJgm0TnCJ
        T51LbtnM55r12s6tDR0BsO26aQqnQnM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-344-SnWm1LNFMsy7f0XT4cGTGA-1; Tue, 28 Feb 2023 11:03:46 -0500
X-MC-Unique: SnWm1LNFMsy7f0XT4cGTGA-1
Received: by mail-wm1-f70.google.com with SMTP id k20-20020a05600c1c9400b003e2249bd2b4so3777457wms.5
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 08:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677600224;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWMAworI50CQabTilrteqDasDy+XoVkceugkq8E6Pr8=;
        b=3mSVv3ff8gk+VAjKGSIU19+Y0j+dHZOpeTsYWrQGi6zcpsqttdFboVsaOSXQx0geTb
         le/EB3PfqwzU1+8zZzUjstGwQ5cHSnBtu2FYDyHCDDIIe89j3ATWhF6FFuOvnzXBRyBu
         JREaZzHceFJusCJ819oHuV4zjFaMONZ0C0biEEdWQ3gI9tGKAc6nliWYsHs22UtyPP1S
         tsJUbVdnd3eFYA7G0H+NzyApkZf30da9JSP8HsMVK+Q75IcGtKo/10zHKy5TtLDNJFXV
         Zk9maUMKIYMc0I7ROKAYlkeakDvJdCAN2/F10NI21nob/qH9VFLyZ7qwQYNsIarRRWpy
         5vRQ==
X-Gm-Message-State: AO0yUKWMwUHhjBHGDmq5UpgKVlC59OUpwfgiMIltdXVpk9mZ8XZbKCO+
        Aq15Ut5JTV5OCIp8Xiwih4/WZ/FOUTS94g5nHUx3H0j3gUYS6jQl207k3Bfp0FTrewloPA0ORac
        a8igPlvJf05nOePSygDueCEE=
X-Received: by 2002:a05:6000:1c5:b0:2ca:fd48:7c1e with SMTP id t5-20020a05600001c500b002cafd487c1emr2573796wrx.48.1677600224600;
        Tue, 28 Feb 2023 08:03:44 -0800 (PST)
X-Google-Smtp-Source: AK7set9v0g4E7whTc7rYOu89mROUSRxzGr6QXBdhfOQaLBzNnR8lC5RcL1m+NJS3PUR1LZvjFt2e1g==
X-Received: by 2002:a05:6000:1c5:b0:2ca:fd48:7c1e with SMTP id t5-20020a05600001c500b002cafd487c1emr2573757wrx.48.1677600224266;
        Tue, 28 Feb 2023 08:03:44 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c020d00b003dc1d668866sm16485490wmi.10.2023.02.28.08.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 08:03:43 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Vikash Garodia <vgarodia@qti.qualcomm.com>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mka@chromium.org" <mka@chromium.org>,
        Albert Esteve <aesteve@redhat.com>,
        "stanimir.varbanov@linaro.org" <stanimir.varbanov@linaro.org>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Fritz Koenig <frkoenig@google.com>,
        "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>,
        "Rajeshwar Kurapaty (QUIC)" <quic_rkurapat@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: RE: [PATCH] Revert "venus: firmware: Correct non-pix start and end
 addresses"
In-Reply-To: <87356wn6xf.fsf@minerva.mail-host-address-is-not-set>
References: <20230207102254.1446461-1-javierm@redhat.com>
 <DM8PR02MB8169809493BF2822E6C29EECF3DB9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <ef09bc9f-d570-be11-238b-bd34063917fc@redhat.com>
 <70c01751-1dd7-c4bd-a96e-94dea437aa40@redhat.com>
 <DM8PR02MB81696369DBFE619E43F81EEFF3DE9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <e87344c6-acef-7f3f-5cac-24961dbd9401@redhat.com>
 <6f97a117-0d9c-e21b-9adf-50f2233ba9e3@leemhuis.info>
 <ea283f0a-ca72-447e-ce87-68c1bbee793e@leemhuis.info>
 <CAFOAJEdBbzqkGVqw+vgNYNxyaTHwvjFyskTwjycP820L2tOctA@mail.gmail.com>
 <b548da46-bf91-6f1c-4b63-4002109056bc@leemhuis.info>
 <9a0bfef8-0b5d-f4d0-a8a5-4bbcacc5c0fb@leemhuis.info>
 <DM8PR02MB8169E16569616870A583B376F3AB9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <87356wn6xf.fsf@minerva.mail-host-address-is-not-set>
Date:   Tue, 28 Feb 2023 17:03:43 +0100
Message-ID: <87edq9hj4w.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Javier Martinez Canillas <javierm@redhat.com> writes:

> Vikash Garodia <vgarodia@qti.qualcomm.com> writes:
>
> Hello Vikash,
>
>> Hi All,
>>
>
> [...]
>
>>>
>>>No reply from Mauro and Linus chose to not apply the revert I pointed him to.
>>>That at this point leads to the question:
>>>
>>>Vikash, did you or somebody else make any progress to fix this properly?
>>
>> We tried with different settings for the registers and arrive at a conclusion that
>> the original configuration was proper. There is no need to explicitly configure
>> the secure non-pixel region when there is no support for the usecase. So, in summary,
>> we are good to have the revert.
>>
>
> Perfect. Thanks a lot for looking at this.
>
>> Stan, could you please help with the revert and a pull request having this revert
>> alongwith other pending changes ?
>>
>
> Other fix posted is "media: venus: dec: Fix capture formats enumeration order":
>
> https://patchwork.kernel.org/project/linux-media/patch/20230210081835.2054482-1-javierm@redhat.com/
>

Vikash,

Could you or someone else from QC please Review/Ack these two patches,
since it seems that Stanimir moved on and maybe is not working in this
driver anymore?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

