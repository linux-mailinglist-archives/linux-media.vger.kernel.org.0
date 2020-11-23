Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F251C2BFF1D
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 05:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbgKWEqu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Nov 2020 23:46:50 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35922 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgKWEqt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Nov 2020 23:46:49 -0500
Received: by mail-lf1-f68.google.com with SMTP id f11so21969136lfs.3;
        Sun, 22 Nov 2020 20:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A2batJNX3Sb2NAphta4ZUVPmR4QZ93tWrIH5Q2h8chA=;
        b=DTkryezSuHLdNPeYQ0nXbMh6ECAmBlyYKp6yRSOiGru+XE6Ail0JTtCpudNEQir0i3
         unVs0F5mFPcs8Yr4eZ7FWF6kg8GPGsvv3CQP5iTCpI5V6IKXoRVUARMcz/VM+zIg8h97
         cEkR9Uz2Bk/AWq3oGqLqGFc1DJiKuf5aRooj6kl5cWid2W0fm7b4/0L3fcFawQvS5Yg5
         ZerC45wMbKYRJEQn12+BzbkGtLH6GNLzdXC+Z+SQ5Ssrm+Ag4xtJCFBPNkaLEYa6bw2x
         HI+rgsZ+oqcwmcywnKOnS4O/WxwtZxBt8SUtkr5QszGzf3Wgf2m95XTt7UcDixu5aUl8
         wWGw==
X-Gm-Message-State: AOAM5310i0IEMV4bgYxlnf+aHW1U703yMzF45QMmLDLsrvZDa5cK4htm
        Balts8699tA8TbR6grznI7/5uEThyo7TXw==
X-Google-Smtp-Source: ABdhPJxrjaIiv8TXSuLGfwAJixj95uOXHaD3ayaEPp1meyHctgq3upjUCjzQN5MPZfTVnQiC7YLNEw==
X-Received: by 2002:a05:6512:358d:: with SMTP id m13mr13892179lfr.435.1606106806821;
        Sun, 22 Nov 2020 20:46:46 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id f8sm1177788ljg.113.2020.11.22.20.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2020 20:46:46 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id s27so1976702lfp.5;
        Sun, 22 Nov 2020 20:46:45 -0800 (PST)
X-Received: by 2002:a19:c509:: with SMTP id w9mr3050799lfe.193.1606106805789;
 Sun, 22 Nov 2020 20:46:45 -0800 (PST)
MIME-Version: 1.0
References: <20201116125617.7597-1-m.cerveny@computer.org> <20201116125617.7597-6-m.cerveny@computer.org>
In-Reply-To: <20201116125617.7597-6-m.cerveny@computer.org>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Mon, 23 Nov 2020 12:46:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v67_VqkLqXKADnj5=EuYBNSB8awK_2V3HeHJBOdnUywNhA@mail.gmail.com>
Message-ID: <CAGb2v67_VqkLqXKADnj5=EuYBNSB8awK_2V3HeHJBOdnUywNhA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: media: cedrus: Add V3s compatible
To:     Martin Cerveny <m.cerveny@computer.org>
Cc:     Maxime Ripard <mripard@kernel.org>, devel@driverdev.osuosl.org,
        devicetree <devicetree@vger.kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 16, 2020 at 8:58 PM Martin Cerveny <m.cerveny@computer.org> wrote:
>
> Allwinner V3s SoC contains video engine. Add compatible for it.
>
> Signed-off-by: Martin Cerveny <m.cerveny@computer.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
