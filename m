Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 901C317EBCB
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 23:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgCIWOq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 18:14:46 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38089 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgCIWOq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 18:14:46 -0400
Received: by mail-ot1-f66.google.com with SMTP id i14so11269224otp.5
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2020 15:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=n5OXXxZXEUIgAIrbk2LaI0OdMckD6PM3iBlKr8Tm8LU=;
        b=IMGvEYrzsj8ccjaLfgLK7inPABgAl8SlYO/8p4MKnk5puURzYL1on8E9uQ/pFn+CiS
         d7bNmiKdA2Jn7jBRCxmRRpWR6bskVX/Dx0mwJ8IptUoAkjLg7R1RRoN9xC9qB4F5SueZ
         /Rhx4uv6tiRd+UdI4X+JJ573/7ZSBRmxnCy59IAyTD4RaCf+YriV0sHjw/1qVkk/9Gec
         DRKaa8m5WKMqM7aBTV84CkzHJI23Gjcl5CVeYofDpgE2tGkfNSPO1tUzE4CoQc+B7H/p
         fl300ClGmTkfHDb290FLNfVKUCcVwZEMMKkQ7ks/RtJzWGD9cNJ9KW5/K6eAZLEy40Ut
         +fAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=n5OXXxZXEUIgAIrbk2LaI0OdMckD6PM3iBlKr8Tm8LU=;
        b=LRtleOrZUH7mUCJgiZq83OILMzGnt3cR9y0L4lmQ7sHSU29Fe6uJ3zMfE/fOSPc3VL
         +D67Lo3HUWgdNemKNCS+m6SpQP0DKYIyJ8xULeYLyYTaa16LP3Zc4DpwyujlAsifYqRZ
         pO5pVh6fb3Rirnpl87kEc249gMuiqCkPzltizT0VlZ29Lbd9715JGOn7i2M8r0clAdZX
         /W3TXT+62l2I9HUdX03ToAPO7+X9pHBbFbAuxOBckRMfR97pivOkHjQeTmUsmQ6X0n+1
         B33sh8xQt3ucRWSmw5nuPSjT+KMZ8x0DZFPCiMC+aU+sMYPiTSzcEL0/Y33uHoAiwgRe
         3fWw==
X-Gm-Message-State: ANhLgQ2n1JGHo9mqO8lZfa5Fvq5xeHAq4gfjWvyU1gFhisfZhgDh6cuy
        zx+RRBb8Gp3ynxXVDMhgCEM2arHPdMEmawvNEOmvJflmEP0=
X-Google-Smtp-Source: ADFU+vsN3fZK9Nwlt69k/j0KAs15iNoMMCPjxZi1q1KuCxE1nR+PRmmbDJE6B/XPeC1+0KkLLdGRLxExHGxCX44yI5s=
X-Received: by 2002:a9d:64ca:: with SMTP id n10mr14785049otl.325.1583792083957;
 Mon, 09 Mar 2020 15:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <BL0PR06MB454878CAF243C837B7131597E5E10@BL0PR06MB4548.namprd06.prod.outlook.com>
In-Reply-To: <BL0PR06MB454878CAF243C837B7131597E5E10@BL0PR06MB4548.namprd06.prod.outlook.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 9 Mar 2020 22:14:17 +0000
Message-ID: <CA+V-a8tnS=xER1FBEXd4hvJu+-Kz0dcafLtrNXLmeTZEPH60kg@mail.gmail.com>
Subject: Re: [bug-report] drivers/media/platform/am437x/: illegal value of
 enum in vpfe_ccdc_set_params
To:     Changming Liu <liu.changm@northeastern.edu>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Changming

On Sun, Mar 8, 2020 at 3:32 AM Changming Liu
<liu.changm@northeastern.edu> wrote:
>
> This email was sent due to the previous one was rejected because of it's =
in HTML form.
>
> From: Changming Liu
> Sent: Saturday, March 7, 2020 8:33 PM
> To: prabhakar.csengg@gmail.com
> Cc: linux-media@vger.kernel.org; yaohway@gmail.com
> Subject: [bug-report] drivers/media/platform/am437x/: illegal value of en=
um in vpfe_ccdc_set_params
>
> Hi Lad,
> Greetings, I'm a first-year PhD student who is interested in the usage of=
 UBSan in linux kernel. With some experiments, I've found that, a unsigned =
underflow might cause undesired behavior in
> drivers/media/platform/am437x/am437x-vpfe.c function vpfe_ccdc_set_params=
.
>
> More specifically, after the execution of
> x =3D copy_from_user(&raw_params, params, sizeof(raw_params));
> the raw_params are filled with data from user space.
>
> Then diving into function vpfe_ccdc_validate_param, when calling function=
 ccdc_data_size_max_bit, at
> max_data =3D ccdc_data_size_max_bit(ccdcparam->data_sz);
> the enum member, named data_sz, of structure ccdcparam is compared with 7=
, otherwise data_sz is subtracted from 15, as in
> return sz =3D=3D VPFE_CCDC_DATA_8BITS ? 7 : 15 - sz;
>
> The potential problem with this snippet of code is that, although in func=
tion ccdc_data_size_max_bit, ccdcparam->data_sz is treated as an enumeratio=
n with the range from 0 to 7 according to the definition of enum vpfe_ccdc_=
data_size, however it's essentially an unsigned 32 bit integer from user sp=
ace. As a consequence, the return value of function ccdc_data_size_max_bit =
might be any value from 0 to 255 due to the unsigned underflow and truncati=
on.
>
> It's worth noting that, although the usage of function of ccdc_gamma_widt=
h_max_bit has similar underflow problem, i.e. the value of ccdcparam->alaw.=
gamma_wd is also an unsigned 32 bit from user space, while itself is a enum=
 type. However it's checked in
> if (ccdcparam->alaw.gamma_wd > VPFE_CCDC_GAMMA_BITS_09_0 ||
>     max_gamma > max_data) {
>                 vpfe_dbg(1, vpfe, "Invalid data line select\n");
>                 return -EINVAL;
> }
> This if clause exclude all illegal values and keep the enum variable in r=
ange, I wonder if it's necessary to apply the similar check to ccdcparam->d=
ata_sz to keep the its value legal as well.
>
> Due to the lack of knowledge of the interaction between this module and t=
he user space, I'm not able to assess if this is a security-related issue. =
Judging from the appearance, a malicious user can possibly manipulate the r=
eturn value of ccdc_data_size_max_bit and make the check of "max_gamma > ma=
x_data" always pass. I'd be more than happy to hear your valuable opinions =
and provide more information if needed. If such a check is unnecessary, I w=
ould appreciate it if I can know why, this can help me understand linux a l=
ot!
>
Totally agree (good catch!), vpfe_ccdc_validate_param() should be more
stringent on checking the user space params. Would you create a patch
fixing it ?

Cheers,
--Prabhakar

> Looking forward to your response!
>
> Best regards,
> Changming Liu
