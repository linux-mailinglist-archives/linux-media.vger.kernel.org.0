Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E95653B876
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 17:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391253AbfFJPq5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 11:46:57 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44429 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390230AbfFJPq4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 11:46:56 -0400
Received: by mail-oi1-f195.google.com with SMTP id e189so6562506oib.11
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2019 08:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I6vltpgxGeg3mA6zJlGPEJVtZW9RABAyDH6DoOQfSzw=;
        b=jouK040PLnioRsDYNyZlZUN7hm0ebUmFAMdGknyq04B2acXicPfnhRL27Ho5QIjfCp
         D3oG5MAV5g+mFNzIWNFekP4CmV9mVIvZ6c9x2meHcRcHqhW9CJkYmtnAUCjQCvNGTjNd
         +32vfS2qZuNqVfCb8ULD7LsQ4HY0baW2oPF6fd9IeMJcQHhXnUVoEtRQt70D3wESV4QD
         d8p+Dw0mvjYfgJTvxcBtktWasF1DQIB6vsIttagstVLrXC88VFw6IAFLQ+gRf52b/Uje
         wGaSYuhlYIgU6UF9MKEPJPmVDgV1FlkNQkSYsUjbgcVO53DsUfFDSM/X1DurS1c+q8YB
         rq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I6vltpgxGeg3mA6zJlGPEJVtZW9RABAyDH6DoOQfSzw=;
        b=qgtHmbcYQw+y37Hi6woNERt1T4YrIlLeAmPQgFph4wWiKD+cfOBAJnixphYh0Dgs9v
         P+9UqXdppqhmi1o2OWmrlWGxgfkMN70NIvEJxgmxHL8GmdEhTR++JW+lr1CEzpABMkTE
         T0Umn9E/hurr5TfrW1QQ6Q39JDP1kjHUFm0mvIkXSRGlgR34+5xJHKUHTYHze+j+k2eH
         /Vsp2Dq7PTZEsWPilMK/CQRZz4QxA8i343hKb1IKsnSRr6ZMTq7UH9D6PYRlLcU1UceQ
         bx/V9ZTWDmXZKoSgzsuOQVnpsDNa20q8xQS2uAN9irdWC5bDhSP3MpzBY1YQEROesREi
         Np+g==
X-Gm-Message-State: APjAAAVk58efFmmnu/Fh3mDc3DjTedOaS7hBHieae2Mef10f/92V2YR9
        WoKmw2Ej4XhDZXiewpDMCDSC2i500swLIaBV5t0=
X-Google-Smtp-Source: APXvYqyNov4Xr1+XtUlbLJI6bFiFP2B/2wMU3HvE8VYECsGuKiAI8sdQNu7zVt21DfCZd36HoRuU/xS/du7G9T4x3OI=
X-Received: by 2002:aca:e1c6:: with SMTP id y189mr2477274oig.92.1560181615963;
 Mon, 10 Jun 2019 08:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
 <20190529154431.11177-1-TheSven73@gmail.com> <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
 <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
 <4afffe3822026e23a55c05b7e18b43a2d6d0274e.camel@ndufresne.ca>
 <CAGngYiUZJCwg-VgOafU=gBgDtaSV++UVmNQawn6d5LunBFg1FQ@mail.gmail.com>
 <CAOMZO5AxL6MeOY=Pooq65B-Ly=t41JVp0Y_nXrYUKk03yh0KJQ@mail.gmail.com>
 <VE1PR04MB6638C5E75F797BD3114C467A89190@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiX3xOHYw97VU-buuLLwu7vuMk23HEatDpk6vgieE7ozXg@mail.gmail.com>
 <VE1PR04MB663874C6BDAE5ED7B5A36A3F89150@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiW9vqHXVt771P7tQvHwJ1ifr2qbtmxnVm7Ff6vY=DjKwg@mail.gmail.com>
 <VE1PR04MB663800AFCE7FF016DBE9EB7689160@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiWJ3u0NpP8Tji0oOJ4-9MFm1Ac1mzur_gL9+e8Jsj4EdA@mail.gmail.com>
 <VE1PR04MB66382A33B135E7A724D13C2F89170@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiWiQ1XRWSsgE5DbMZTiy9HkSvhvWNn3cPPw9p6HZZaBEw@mail.gmail.com> <VE1PR04MB6638ECD904CC0F9A6F95302F89130@VE1PR04MB6638.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6638ECD904CC0F9A6F95302F89130@VE1PR04MB6638.eurprd04.prod.outlook.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Mon, 10 Jun 2019 11:46:44 -0400
Message-ID: <CAGngYiWa8o4hEFTZauTtb0mWnzusVcYakvMn84eg_Q=CugKUKg@mail.gmail.com>
Subject: Re: [v8] media: imx: add mem2mem device
To:     Robin Gong <yibin.gong@nxp.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 10, 2019 at 5:09 AM Robin Gong <yibin.gong@nxp.com> wrote:
>
> I can reproduce once enable your config to build firmware in kernel, but no such issue
> if load sdma firmware from rootfs as imx_v6_v7_defconfig. Maybe firmware built in function
> broken by some patches. Could you try with the default firmware loading way which is from
> rootfs(/lib/firmware/imx/sdma/sdma-imx6q.bin)?

This is it ! If I add the firmware to the kernel directly, I see the crash.
But if I use the firmware fall-back mechanism, there is no crash.
And if I build imx-sdma as a module, and insmod it later, there is
also no crash.

I patched imx-sdma so it logs the adler32 checksum of the firmware it's
loading (I tried using the kernel crypto API, but it doesn't work this early
in the boot). I notice that the firmware is always the same, crash or no
crash:

firmware in-kernel (crash):
[    1.370424] imx-sdma 20ec000.sdma: firmware hash: 69BC0F09
firmware fallback (no crash):
[    6.466394] imx-sdma 20ec000.sdma: firmware hash: 69BC0F09

My guess: this could be a timing issue. If the sdma driver loads 'too early',
the boot crash will happen. Maybe the driver needs to check for a
missing dependency on boot, and -EPROBE_DEFER ?

Robin, should I make a bug report? If so, who do I send this to?

Code used to print the firmware hash on imx-sdma:

#define MOD_ADLER  65521

static u32 adler32(const unsigned char *data, size_t len)
{
    u32 a = 1, b = 0;
    size_t index;

    for (index = 0; index < len; ++index)
    {
        a = (a + data[index]) % MOD_ADLER;
        b = (b + a) % MOD_ADLER;
    }

    return (b << 16) | a;
}

static void log_fw_hash(struct device *dev, const struct firmware *fw)
{
        dev_info(dev, "firmware hash: %08X", adler32(fw->data, fw->size));
}

static void sdma_load_firmware(const struct firmware *fw, void *context)
{
        struct sdma_engine *sdma = context;
        const struct sdma_firmware_header *header;
        const struct sdma_script_start_addrs *addr;
        unsigned short *ram_code;

        if (!fw) {
                dev_info(sdma->dev, "external firmware not found,
using ROM firmware\n");
                /* In this case we just use the ROM firmware. */
                return;
        }
        log_fw_hash(sdma->dev, fw);
