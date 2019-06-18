Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAA44AA05
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 20:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730102AbfFRShm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 14:37:42 -0400
Received: from s3.sipsolutions.net ([144.76.43.62]:45598 "EHLO
        sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729900AbfFRShm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 14:37:42 -0400
Received: by sipsolutions.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <johannes@sipsolutions.net>)
        id 1hdIz3-0004YC-56; Tue, 18 Jun 2019 20:37:29 +0200
Message-ID: <e5b8756590260b4d6a26cf9f02deb9d157cfca83.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/4] staging: media: tegra-vde: Remove BIT() macro
 from UAPI header
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Joe Perches <joe@perches.com>, Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jamal Hadi Salim <jhs@mojatatu.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Jiri Pirko <jiri@resnulli.us>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>
Date:   Tue, 18 Jun 2019 20:37:23 +0200
In-Reply-To: <26cd63896d6930385b4f770e305f0782a455a688.camel@perches.com>
References: <20190618161458.20499-1-digetx@gmail.com>
         <20190618161458.20499-5-digetx@gmail.com>
         <26cd63896d6930385b4f770e305f0782a455a688.camel@perches.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-2.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2019-06-18 at 11:23 -0700, Joe Perches wrote:
> 
> include/uapi/linux/nl80211.h: * bitmask of BIT(NL80211_BAND_*) as described in %enum
> 
> 
That's a comment :P

johannes

