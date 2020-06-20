Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418942022B4
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2020 10:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgFTI5P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jun 2020 04:57:15 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:42627 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727023AbgFTI5O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jun 2020 04:57:14 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id mZJFjDFv9On2BmZJIjuA4f; Sat, 20 Jun 2020 10:57:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592643433; bh=IEdTbSDXZI/wvTrfPFs6TwvIoNj1x1hH4PdSv6XWsfs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YSsRA99Bctogpc4/QI48L1Iut7hYVe0heWH8icHdFhmExgysqtlXEaplLDEVlnBOg
         anKjwuX5CTliMfUn3R1PEfo6xEgfnvPwj+sUMvfKoY7mjuL2t6iOiTV2ALCCFAOhqp
         xYNQu2QTb/OHV6MzJC25tO48eSfe+B//2//BmvnaZVAtsoFciW/FgdWkRHfo8s6OE9
         ubiaPr2+UslVrzVafHHPDS/Yr2JW2kuCHgHc6+XZdUk23Voi3VFR4BSdHrgFotouKi
         9qlMMHW/glYHbqrjPN21WQ1FNFADgLjrd43zHBV73O1Zqb9Aam+P4l58XniY4Org6W
         jqoa18DVRRryA==
Subject: Re: [PATCH v5 2/2] media: cec: i2c: ch7322: Add ch7322 CEC controller
 driver
To:     Jeff Chase <jnchase@google.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20200615193811.233737-1-jnchase@google.com>
 <20200615193811.233737-3-jnchase@google.com>
 <3aefc5c4-2af1-59f2-0797-9a5baf91482e@xs4all.nl>
 <CALTkaQ3n30nS-b1XuMiu_Z4+FfD0horJDagCPBaUqCCx4JhtdA@mail.gmail.com>
 <e45bf5a1-3862-66a2-213b-f7e5563e5a5d@xs4all.nl>
 <CALTkaQ02_ttD52h=74hGos09a0ihQwv-rQS5vwpDsrdnK_rYrg@mail.gmail.com>
 <72ea0f61-5fd4-47b6-4b0f-db620ee661db@xs4all.nl>
 <CALTkaQ0SFiX1rNkz5WOGCs=ZttYG9utKntsRyQKB-aWzDj-Cvw@mail.gmail.com>
 <CALTkaQ23yCWbTSaSAfM_63_nhKBTf-n8vr-EQoU=SehAfg6RaQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <739bc351-0463-81ec-aa96-293fe7afa53f@xs4all.nl>
Date:   Sat, 20 Jun 2020 10:57:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CALTkaQ23yCWbTSaSAfM_63_nhKBTf-n8vr-EQoU=SehAfg6RaQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDKgTNrEHSsErdvOblnx4Tw03qpObLIID7Op9NFudTbh3qHqfV6rba2ifAuhjs+GdVYYd/uawkXqWAr7fJfuubJNmWkgYDVYquVI7WTqBtd68p41djBR
 LpWINSPACEurGbngNSwd2ysqs2X4d9T/uPWGzo/uF6l+s5CsTPuLwI5Z1P/bMzcDmkWKrd+PxMn/VNtPEQjaVBvp5p/z+juP3iBn812Bq8yOKZFsMKM6x8Zn
 IaICCRW/N1MAEtTcvs+5Rw3eP/1KygOipR7U8uemjMSONuJVRFMphekV9eKjcRmUP/hRAdGShcJ75Jia3Pb4zQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/06/2020 06:56, Jeff Chase wrote:
>>>>> This particular chip can actually be used both with DMI matching but also
>>>>> on an ARM with device tree, but since you can't test this on an ARM board,
>>>>> there is no point in adding support for that.
>>>>>
>>>>> However, compared to the cros-ec and seco drivers you can do something a bit
>>>>> different here: those drivers just return -ENODEV if there is no match, but
>>>>> since this driver reads the EDID it can just continue as long as it does not
>>>>> set the CEC_CAP_CONNECTOR_INFO capability.
> 
> Hi Hans,
> 
> After looking into this I don't think I want to actually register the
> cec adapter with the hdmi port's cec notifier because then it will
> start receiving physical address updates from the port. Since the
> driver already updates the physical address itself it seems like that
> would cause some issues.
> 
> I'm looking at just adding the connector to the adapter directly using
> `cec_s_conn_info()`. But it doesn't look like I can get the conn_info
> without registering with the notifier. Do you have any thoughts here
> before I try tackling changes to the cec framework?

It's a very good point, I hadn't realized this complication.

The notifier support is definitely required for this, but there should be
a way to prevent the notifier from updating the physical address since it
is controlled by the CEC adapter instead.

Suggestion:

Add a 'bool adap_controls_phys_addr;' field to struct cec_adapter. If set to
true, then cec-notifier will skip the cec_s_phys_addr calls.

This driver then just has to set this field to true and it should work.

Regards,

	Hans
