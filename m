Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4206922C0
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 16:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbjBJP6F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 10:58:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232053AbjBJP6F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 10:58:05 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3838512F30
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 07:58:04 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id w3so6205643qts.7
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 07:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=10vxGmbgDr7wx2HyvH0DAWiAZkl1KG/xlA3V12qWbZA=;
        b=0uaM5pNUhyAmZZM/o37ylVHQSQPyGxN5ZMCUHXPKG1NbeNsj/rpZy3+fTnBn7CI7q1
         Py5XSHJK+TUuk/7FSHQ+D+BW8M4EWp/SdotKY6o+KhxWfNUgfjpLzftizniueZvk8hbX
         XRe4aSETF5GPf0NL20kGPUwDdSnLlHiaF/c4e7vgrjCl6QdDUMXhgPcm2ThRiOe0BuVb
         Q4jnjZogE9HvFtlbcp1cRtpRtpy/IQGf2JyX7ZozZaPha2S6U8ldrtU5lZmkmF1fg6+F
         aZXJaw4sTniE/u7BiOnt/i5gKL1X3wRvb3JfioXvHq68a+qSb3VZSnUp2AzI59E8k9dP
         l4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=10vxGmbgDr7wx2HyvH0DAWiAZkl1KG/xlA3V12qWbZA=;
        b=IxglRhUOi7JqnIPMMsMfwNVpmf3cqUOvJCoHzDrFiGbkUfYuvRPwsfR0vC+K8/486K
         MRNnJVjPSQBWo18bVnAk56pEb1I6TEqrfxJAxOB/CPbqeJgdOXR93fKKKeuF6oeouOOV
         Ze03qEpq5AGBNCrwnaKWCAGPpj25959Kvmmjg8FtAhmIyAVqmJ4JhQXY4zWGY5yWyu8b
         wMgU1Trd9GIrnX3AtG0ZzrKDo1DWZ17gOFkD5Nv6bMxEdkpgopl1jCQFY7SdPoMJhbE7
         02Nd+GyWWPjmkmlw+tx5Xp1bDHLFXO0AM/bnCJbrGjt8a+AR4g9w0s3dEpd4tXrpg5fW
         XAaw==
X-Gm-Message-State: AO0yUKWXvexF7sLE3fNCurG26Bv5ayZR3aLHyEsE9snFXIQIsydcnsDw
        csD2nEzIxWG4uXt3TgRXa/OvEg==
X-Google-Smtp-Source: AK7set8xjGXRikXC7sD4pKl1zY2XWmSYWXh8zMZkhHDUA2OlS+80XBOHJlTUxPSWkJ+yuKz85g0AxA==
X-Received: by 2002:a05:622a:c2:b0:3b7:fafc:73e3 with SMTP id p2-20020a05622a00c200b003b7fafc73e3mr26232840qtw.41.1676044683303;
        Fri, 10 Feb 2023 07:58:03 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id r3-20020ae9dd03000000b00731a76883basm3745378qkf.101.2023.02.10.07.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 07:58:02 -0800 (PST)
Message-ID: <e1bf1a456ef83eeca9ad4dd18c55f7e423105be8.camel@ndufresne.ca>
Subject: Re: Mainline zyncmp vcu driver: support for the video decoder
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Deji Aribuki Ext <deji.aribuki.ext@brainlab.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Laurenz Eschwey <laurenz.eschwey@brainlab.com>,
        kernel@pengutronix.de
Date:   Fri, 10 Feb 2023 10:58:01 -0500
In-Reply-To: <20230209135444.GB30549@pengutronix.de>
References: <FR2P281MB28166C9AD7111B3488BCE297A8D99@FR2P281MB2816.DEUP281.PROD.OUTLOOK.COM>
         <20230209135444.GB30549@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 09 f=C3=A9vrier 2023 =C3=A0 14:54 +0100, Michael Tretter a =C3=A9c=
rit=C2=A0:
> Hi Deji,
>=20
> On Thu, 09 Feb 2023 10:03:19 +0000, Deji Aribuki Ext wrote:
> > I would like to know if there is a plan (or if there is already have a
> > patch-set) for adding support for allegro dvt video decoder.
>=20
> I currently don't have any plans or patches to add decoder support.
>=20
> A while ago, there was a bit of interest in decoder support, but I haven'=
t
> heard of anything new for a long time.
>=20
> Are you interested in adding decoder support to the driver? I would be ha=
ppy
> to review and test patches.

Isn't the decoder side stateless ? That could be difficult to achieve witho=
ut
reference code or documentation.

Nicolas
