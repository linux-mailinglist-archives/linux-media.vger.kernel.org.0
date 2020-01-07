Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E186131DBD
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 03:43:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbgAGCny (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 21:43:54 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:41273 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbgAGCny (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jan 2020 21:43:54 -0500
Received: by mail-qk1-f196.google.com with SMTP id x129so41413845qke.8;
        Mon, 06 Jan 2020 18:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LyWXGqlpcvNUsV6/byFCrmEtMHIShb1ijGFLD53ibQk=;
        b=PlPUMN7d9Nn66k3HHa44pNzYSnqyDuDqc2kzItmd2CaBY4trqh7Qe7dWFGJnuw8DHA
         V8j21PR63pR83jsce5aby7Nm3lDKA+lc9frixN2s+Zn3eolm3vFF1bGBtiCC7S2rymav
         O3DjKq05MkPObXSKhaa66XDt5q4VXdt621cWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LyWXGqlpcvNUsV6/byFCrmEtMHIShb1ijGFLD53ibQk=;
        b=gxo5jM4RRxB5SRTONwhgBcu1x9ijevFfnHcpmx7lSAwCb43hhnET2DIOK8t9kc0/fF
         aA6qgAA8R7MJvRLtWQDVvg4/zj3Yygm5FAnJpBv5gp7FPGk4kTjX6dTd8UKTXGOLv+e3
         yrjhG+ktTu5iIKPvvFhMO6mekgdKAy8E1b3TsP1cmWEmriV/cnDOXPLO1mkU1zh/HvGh
         ucx008p0X24FCeZOPmC07f2uTGqYdL24wShoDXoh8BLPLvgfwuCdMROFVRR431ytF78a
         U/698cmLZPUz2y3F+6Yo8daGUKMHef40H9q9hntaY8qPXBGnyBEN8UY4Q9CpJAHIys/W
         LNLg==
X-Gm-Message-State: APjAAAXlro5EzUJDAmNrm468woV9RSLDzcXvhWEUrrYRyFl/UvCCvjld
        BDA7d65NfO4yM51X7MChfACmxUX948BYHCLT4G4=
X-Google-Smtp-Source: APXvYqyBIRxMo+kjMv9ML/yu7Ter7COQGfOpYifJbteEuBwqpPXih62HhMK1UnjdlPXu0XOWSax2OmNtaiyS34TkbnI=
X-Received: by 2002:a05:620a:849:: with SMTP id u9mr86645362qku.414.1578365032850;
 Mon, 06 Jan 2020 18:43:52 -0800 (PST)
MIME-Version: 1.0
References: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com> <20200107011503.17435-3-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20200107011503.17435-3-jae.hyun.yoo@linux.intel.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 7 Jan 2020 02:43:41 +0000
Message-ID: <CACPK8Xcf7TOWh673aQwOk385b2QaMT1i7nUHy=18W-rVLX9ewg@mail.gmail.com>
Subject: Re: [PATCH 2/3] Documentation: dt-bindings: media: add AST2600 Video
 Engine support
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-media@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 7 Jan 2020 at 01:14, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> The AST2600 has Video Engine so add the compatible string into the
> document.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Acked-by: Joel Stanley <joel@jms.id.au>
