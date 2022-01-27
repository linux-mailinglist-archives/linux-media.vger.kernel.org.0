Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CC449D9DA
	for <lists+linux-media@lfdr.de>; Thu, 27 Jan 2022 06:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235130AbiA0FLt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jan 2022 00:11:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234894AbiA0FLs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jan 2022 00:11:48 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77590C06161C
        for <linux-media@vger.kernel.org>; Wed, 26 Jan 2022 21:11:48 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id r65so5076427ybc.11
        for <linux-media@vger.kernel.org>; Wed, 26 Jan 2022 21:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=cTX8+aELljL75aGmFQLFVAGHxGfTYO/25DOtLiHIZIQ=;
        b=joLZdTsBQb3SzgeODyVvi8KRGdSSrXGWBGbbDlhcvavSX3zTl8RDlprxeK6RvFtoTQ
         tqbKSyL1xJ2J+U2v3cYAR6fD1hCmlaQw7pYM6yGybQQ5MIns+E2K4+wrsPb53PVhnzUa
         ixlM2bEePT6i0b1ja+d99p0YxxKq9AdcdLpPJjUuIVJEARpN3I1SVGLOwVPZv6G7imyK
         Az3E5iEtK+Dc9TrDKURGRImSiY3+lfdNO7zoeTgohL6A76BWSsyOZmtXw9PJUBdUhcBm
         ehMFKs3CVKa/vW+qtMhHC5ld4yoSYfzVc9sHVH5p6nkC419Ft9Elhlf2oOXcFCVjUJ6C
         Rnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=cTX8+aELljL75aGmFQLFVAGHxGfTYO/25DOtLiHIZIQ=;
        b=aqm1lJ1E2A4Wzljsuwb5PIKg70Gq4nvVtQSi68eZr6Cb4DZAe0z0hD7mwSpuR2P+9y
         x72qhQff8+GNSFtEXKIfRlkzmUJWSFTtoFbbPeRBSsa8A7jVxbBt2TdglLX8XYdGbZ2N
         b6GEUdGzyieafDFphzsPHBfHiXjk8Drub+ZahfOfmev4r9Oz+QFYgHBFiVE2iqQ1c34z
         ZkYr/BFp85iT5/MsuDQIzfVQrnbKFoAcniR97OJPu3UmI8eCBT4gtwn6nUGVEaTIvPPu
         aYOdMPv647TQDgiEcNXmXf9XsrVrOpV4cJdYXpXZP+DUPJAHwpqOQEWllwKweix+840n
         93pg==
X-Gm-Message-State: AOAM532qj8FogD4N8u2WUo+maaMyOMQysxJHedcBuTarkTz+iNf7qdaT
        8+OcmGYdSZZzT2tEb2i92a+jhXDZ81Uo0x3tKU53N/ZNly5NdA==
X-Google-Smtp-Source: ABdhPJwiaxvY6WIFBgEXrsMsLoY6clQt41kGohyFnEgf40cggRxHb9TYcHpJZ7fx4lwpA4ODr46LW9rU7Ml1vAcqyj4=
X-Received: by 2002:a25:4e02:: with SMTP id c2mr3232370ybb.47.1643260307763;
 Wed, 26 Jan 2022 21:11:47 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7010:1616:b0:1f3:2ace:1f05 with HTTP; Wed, 26 Jan 2022
 21:11:47 -0800 (PST)
Reply-To: charlesjacksonjrc@gmail.com
From:   Charles Jackson <shawnmendesm74@gmail.com>
Date:   Wed, 26 Jan 2022 21:11:47 -0800
Message-ID: <CAL+f4AwLtYtH9Wwrb=XWoXuzYgkCzJ0FsNivKbBJ6r6VCy9PCA@mail.gmail.com>
Subject: =?UTF-8?Q?Herzliche_Gl=C3=BCckw=C3=BCnsche=21=21=21_Antworten_Sie_zur=C3=BCck=2C_u?=
        =?UTF-8?Q?m_Ihre_gespendeten_Gelder_einzufordern=2E?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--=20
IHR E-MAIL-KONTO WURDE F=C3=9CR EINE SPENDE VON $3.500.000,00 USD F=C3=9CR
WOHLT=C3=84TIGKEIT AUSGEW=C3=84HLT. ANTWORTEN SIE UNTEN AUF DIE E-MAIL F=C3=
=9CR
WEITERE INFORMATIONEN

E-Mail: charlesjacksonjrc@gmail.com
