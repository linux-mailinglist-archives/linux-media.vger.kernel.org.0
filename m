Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42D8991083
	for <lists+linux-media@lfdr.de>; Sat, 17 Aug 2019 15:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbfHQNWT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Aug 2019 09:22:19 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41414 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbfHQNWT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Aug 2019 09:22:19 -0400
Received: by mail-pf1-f193.google.com with SMTP id 196so4569926pfz.8
        for <linux-media@vger.kernel.org>; Sat, 17 Aug 2019 06:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5TnfteLCEwYbhKH/qGjZd3LefpGwfd2ADQQBr92a5DQ=;
        b=rii9HvpHQKVhvhcI5UPx3Z57zQiBEVAFPP5mcdv2QZOwyU9NzL8L3yI2rDvAS09qM7
         UZKBqbZpapxtLqgeIuVfI5jo7QtWaART3jW7RcEik6+6Ar0xGchB4vzf/B6beD290i6F
         qHIUCAKCQiMeETox8kTo7JFeKfvHh6A7mnl65l7oaYu25QwsZlvC6Y0bvLxNsfEpDeow
         XB7hrl1l93gGXOaKRlEKoY+MZ4DO1saNMx8sN9S5rXxn+Aagc+xUfXSV//oY9PzugiRE
         wiHmwmuS0KSVo8Tu28zvicdaH6P/Z1rrzLRwrBFbrHfoSo0BxR95/1T+3TATElfbO6gr
         wSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5TnfteLCEwYbhKH/qGjZd3LefpGwfd2ADQQBr92a5DQ=;
        b=goIl2MngMPuQj2vo/WU75XlsnDKazvh9eQoM98iSoNk8WdN+zrffjsAG3kQ6VQjLyp
         DkLIOgPuaMoji1E8tn1SC6sZNuzvt+mkphnv/q3D7tpxVtqugOYRlyGYlvQnvFrK6S8A
         Ne2bW4CIzwd+hWq7TH1q01iDQZPSuvm2p1gtjuaX6bXbu93L1D6b1wF8QttiFRGN2spg
         nnG4LpnEeP+4pDG6H6NDQM0am9/i5cNMlH2IFMxMX9Zc6QxMpA69EuZo231lNpPeXeJW
         +sVHSKb61ii5qRstXbzoZgHqkFXmcVz6lh7HzbXfz+bpv55oN+TrcrM+ZcaXPOijYWEC
         h07Q==
X-Gm-Message-State: APjAAAWg1q/Bxgg2z9rRq1N97TYU5GxziCMtrfhMlCK72Y03aS0Ug6au
        I/72RLYzvPQiqpEgvASBMe8=
X-Google-Smtp-Source: APXvYqy/TYh/tPhbvbMVlCguSpkzWESGVjB1oU8hfMpfMGmE9qGgat+Atx6mg5QepmjzB/hFonZAdA==
X-Received: by 2002:a63:553:: with SMTP id 80mr12353351pgf.280.1566048138272;
        Sat, 17 Aug 2019 06:22:18 -0700 (PDT)
Received: from [192.168.3.4] (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.gmail.com with ESMTPSA id w11sm8241152pjr.15.2019.08.17.06.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Aug 2019 06:22:17 -0700 (PDT)
Subject: Re: [PATCH] dvb-usb-v2/gl861: fix wrong memcpy
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Antti Palosaari <crope@iki.fi>, Sean Young <sean@mess.org>
References: <98cb0a1c-0db8-951b-80e1-12756678db9a@xs4all.nl>
 <6c2806fe-f104-84bf-21b8-21df9b3112cf@gmail.com>
 <20190815220811.6ba32749@coco.lan>
From:   Akihiro TSUKADA <tskd08@gmail.com>
Message-ID: <df8060a6-9666-3dd1-e041-620891970e7c@gmail.com>
Date:   Sat, 17 Aug 2019 22:22:14 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815220811.6ba32749@coco.lan>
Content-Type: text/plain; charset=iso-2022-jp
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Could you please test the patch and check if the return results are
> now consistent and that it won't break anything?

I have tested the patch and it worked without problems.

Testd-by: Akihiro Tsukada <tskd08@gmail.com>

I could not noticed the bug because
the device was registered without any error messages,
and it seemed to work even with the bug.
(Though actually I was wrong and missed that
 the device does not work after reboot or re-plugging).

After applying this patch, I have confirmed that the device
now works after reboot/re-plugging without any problems.

note:
The patched func: gl861_i2c_read_ex was used in device's early init,
called from d->props->power_ctrl (from dvb_usbv2_init).
But dvb_usbv2_init does not check the return value of it,
and if the device had been initialized previously
it can work even with the interrupted init process in power_ctrl().

--
Akihiro
