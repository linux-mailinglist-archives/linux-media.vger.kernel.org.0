Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4E603312B1
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 16:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhCHP6H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 10:58:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhCHP5i (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 10:57:38 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A142DC06174A
        for <linux-media@vger.kernel.org>; Mon,  8 Mar 2021 07:57:38 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id j12so2817449vsm.2
        for <linux-media@vger.kernel.org>; Mon, 08 Mar 2021 07:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SwCFKt4GMozKY730ds1tdX8e7lguf4IlSDg7liGwqag=;
        b=uVTM3kaXojfmBzvO37KITKTrxLkPmHU1poLanoepTW0qTgWVZm/5x+F/I4G5bSwr/I
         kZToSGaToHTvNcnZpH1LbXXxdItf0LsmPcDBblkzdYfLfH0AnakyZT5ROjW3ih4euyfx
         I8uHxryN+8cX9afGFLptLJgu6UPQHmcIOjqiY6H78RVZihypTqSchQSPDwGutEAXQXwi
         rycioaUyd+s1up7QIh8GCngrGdJlFBnjraiDdvBy1sdpjv4ptqQ2AuH9tvfXR6TM1AOh
         5kJgV2VmTnShyz1xD4uDqqEA7IU4coUsPYTPkelrYqKjA0TEMAhKipsm3y0HAqdpDnZN
         09CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SwCFKt4GMozKY730ds1tdX8e7lguf4IlSDg7liGwqag=;
        b=dpJ1HsX930kjGFUnvbOk7KZD17Os9oB3P8NKMaMfhakE7mwa2UaCfhiG6K4D9i+SKZ
         Xk9IFJQNeE95cJzWbvHTtut2Lx0pK3nBflMQBFEOqDHd0zrfBgzqAIwTzw5lyZ+MsQzc
         KetW05pt+cYDqcR2uc1Ruznox3CAiGsHsvyFVb2unXgC/I5mYf9hennZSlXByrVUdZvZ
         aFHH+Ql1iIZRWeGKa/lMzQByl2t23F/llV/oUD8awKllS75YzWF4ddC1A8sgUAQpCEQO
         ZeDz86xbxaTL2gpyo6+wvIBfONvIgzkCV0SmuCfBlschYn/eCn7GrnXzCa8dnOKGIiXW
         hrQg==
X-Gm-Message-State: AOAM533Al4Rn7Bpn4F9MYGGqMF3u83LPMa46G85pqP69eFXiraTrAzA5
        9eqYXHovWnSZiXlmXJBbspcCphjFJ7fV08kidcs=
X-Google-Smtp-Source: ABdhPJxRY5PAXQbO2E8L7KGjxzRnWIIivSjsRhaRYV3E7/RFN0Jf9vaLtpIiAen3eZB8wpvg511wf1eiUeCvrh7B+ck=
X-Received: by 2002:a67:f04f:: with SMTP id q15mr13359263vsm.22.1615219057722;
 Mon, 08 Mar 2021 07:57:37 -0800 (PST)
MIME-Version: 1.0
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
 <20210305183924.1754026-8-emil.l.velikov@gmail.com> <915739c6fc01f17b00c4fac8b7fede1f25396286.camel@collabora.com>
 <CACvgo51peuKsuqx-NwZSWU4Ys1q5MuXb=BRx7GLo3tkWH+vb0w@mail.gmail.com> <2e921a53-def3-ed3a-6240-b81ea3ddf946@microchip.com>
In-Reply-To: <2e921a53-def3-ed3a-6240-b81ea3ddf946@microchip.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Mon, 8 Mar 2021 15:57:26 +0000
Message-ID: <CACvgo52dNRyiLDGDf8wQMKoxsCUyn3Ro=hHL7GAMtVXRdC_19A@mail.gmail.com>
Subject: Re: [PATCH 7/7] ARM: dts: at91: sama5d4: add vdec0 component
To:     Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org,
        linux-rockchip <linux-rockchip@lists.infradead.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 8 Mar 2021 at 13:21, Nicolas Ferre <nicolas.ferre@microchip.com> wrote:
>
> Hi Emil,
>
Greetings Nicolas,

> So nice to see this support! Thank you so much for handling that.
>
> Little comments below...
>

> Nitpicking: I would use "microchip,sama5d4-vdec". We tend to use the
> microchip name for new DT bidings and compatibility strings.
>
Should i use Microchip (instead of Atmel) only for the DT bindings or
throughout the series?

> I'm fine with having a "staging" component. Maybe add the hantro vdec as
> a module instead.
>
Ack, will do for v2.

Thanks
Emil
