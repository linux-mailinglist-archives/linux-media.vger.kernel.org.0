Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E28E452C1D0
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 20:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbiERSBd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 14:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241370AbiERSBT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 14:01:19 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA79E8E19C
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 11:01:16 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id s22so2245659qta.0
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 11:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=qJdPfDAzDwvVRv+u9BnfeQFcO0mMD8IZyG0tIwD58i4=;
        b=OSkPWWQU7PDNLxypKIpfbolINmKem5TYifF5IzL2ovEj1w3X0kSq01YxLPBayHFwKa
         CHjbjIEnVWW8naC8oKSmx/w7s9Ef0nw5lCuCRd9cJeAW8flcne4JKL5iDO87b5tGq2bf
         7g5aSMZe9ydlVUbFUtq+F7njR4meLlkDXXhm4xkDMCGgFM1Zb4m3w1wSflJqCdRlTeLR
         kVBsiRgoWj9mD7tZfqMOg/557uhWgerjFYYISrcKJsJFkFQ91bE94QJ7pSZItRzVpQcV
         70seQhlBuNxi/jV2AjAh3Fp6+e15zfi78fUHa2KtPUeByx/4yoZe07tK2NFvwuCu3w9q
         FEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=qJdPfDAzDwvVRv+u9BnfeQFcO0mMD8IZyG0tIwD58i4=;
        b=09Ija0ukW7Yp2D0jY4K230UN1Z4oDsfOzUmIo3DlXFFOwJtySjTfHYg5hK7z4Af4rN
         kDekKYNcbIIizqZgx6vvNwIMHjkKTotlSlHF48k3QkH3KrTIy5zXax3rLC/BNRGImzsa
         OBKGhh0/B+2oI/3PwrvoH442fmeDcXNlXJeQVyOV85YvkzYLNzu8cjETl6Jnnn0ki3wp
         24ITR1t4eLvXaBABKi6LtJ28iHif1POoDbJvVFLpzQiEiFlIIs6r3AI99rnJHidlWA0r
         EPac6dh8I1OQdopIU9w41M4uy2d+GelXJYpy20qJXBMo1iNPs7RwBYg6z7U7TXbAuuKp
         SYSQ==
X-Gm-Message-State: AOAM531g605aO7v5fhPPiFhpFOe87HCleTg5C7QSqYPdCmkhfpdJGhIz
        vx/Qit8bSf7FmA0yWqTsOXycQNKKtTkohg==
X-Google-Smtp-Source: ABdhPJwTUVClPaKklVNnRzn7gswSW3fTM596/Jj+PyTkP+qd4/1WdY6QecZ3al6E7j/arTtDriYfPQ==
X-Received: by 2002:ac8:5e4c:0:b0:2f3:c50e:53a6 with SMTP id i12-20020ac85e4c000000b002f3c50e53a6mr844696qtx.499.1652896875778;
        Wed, 18 May 2022 11:01:15 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id o64-20020a375a43000000b006a328ed2cecsm538992qkb.29.2022.05.18.11.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 11:01:15 -0700 (PDT)
Message-ID: <a7007268a65846674b82a108215992d39b430b38.camel@ndufresne.ca>
Subject: Re: [ANN] Media Summit at ELCE Dublin: Request for Topics
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Date:   Wed, 18 May 2022 14:01:14 -0400
In-Reply-To: <325cc388-6f65-0727-92ab-d9b87e7ade1c@xs4all.nl>
References: <325cc388-6f65-0727-92ab-d9b87e7ade1c@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Le vendredi 06 mai 2022 =C3=A0 15:20 +0200, Hans Verkuil a =C3=A9crit=C2=A0=
:
> Hi all,
>=20
> Since countries are opening up again and travel is (at least for now!) a =
lot easier,
> I am considering a media summit during the ELCE in Dublin (Sep 13-16).
>=20
> See here for more details about the conference:
>=20
> https://events.linuxfoundation.org/open-source-summit-europe/
>=20
> Of course, this only makes sense if there is something to talk about. So =
please reply
> with any suggestions for topics!
>=20
> Also please let me know if you would expect to be at such a media summit =
in person.
> If only a few people would be there, then there isn't much point to this.
>=20
>=20
> I have two topics:
>=20
> 1) Discussion of the media subsystem development process: any bottlenecks=
, any ideas
>    for improvements?
>=20
> 2) I can give a presentation on the work I've done in the CTA-861 standar=
d (used by
>    HDMI) and the edid-decode utility.
>=20
> I'd like to make a decision on whether or not it is worthwhile to do this=
 in a week
> or two. If we wait too long it might be difficult to get a room for the s=
ummit.

Andrzej, Benjamin and I works on on stateless encoder, I'd be happy to intr=
oduce
the real-life challenges and the share around the direction we have in mind=
. We
want to collect various ideas and adjust our direction accordingly.

regards,
Nicolas
