Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 216B42A937B
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 10:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgKFJzE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 04:55:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:37882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726075AbgKFJzE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Nov 2020 04:55:04 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E42C721734;
        Fri,  6 Nov 2020 09:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604656503;
        bh=fq0Ui8t6PiSDl63PaQnqQ+wD7V5/mQ8ZBFhNNG3yCok=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iOqu7iq8fkqhQinW+HWeXRONm4gVqP0ORpaGzDUMT9zotN8/ZoAt8k4smbdnLkRfA
         gQF4QwYnBsQf3JTygZryT4dYi6nYvqpqKGLuqzS6PEjkhnobvGexT83gHte/RclSzw
         WjuqDzk0ase4qrOZuSmZgJVWNdu/bBS1goiCMzjw=
Date:   Fri, 6 Nov 2020 10:54:50 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        "Andrew J. Kroll" <ag784@freenet.buffalo.edu>,
        Andrew Morton <andrewm@uow.edu.eu>,
        Andy Gross <agross@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Bill Hawes <whawes@star.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Colin Ian King <colin.king@canonical.com>,
        "C. Scott Ananian" <cananian@alumni.princeton.edu>,
        "David A. Hinds" <dahinds@users.sourceforge.net>,
        dri-devel@lists.freedesktop.org, Filip Aben <f.aben@option.com>,
        Gerald Baeza <gerald.baeza@st.com>,
        Jakub Jelinek <jj@ultra.linux.cz>,
        Jan Dumon <j.dumon@option.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joseph Barrow <d.barow@option.com>,
        -- <julian@uhunix.uhcc.hawaii.edu>,
        Kevin Wells <kevin.wells@nxp.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linaro-mm-sig@lists.linaro.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, Marko Kohtala <Marko.Kohtala@hut.fi>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Mike Hudson <Exoray@isys.ca>, Miloslav Trmac <mitr@redhat.com>,
        Nick Holloway <alfie@dcs.warwick.ac.uk>,
        Palmer Dabbelt <palmer@dabbelt.com>, paulkf@microgate.com,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        processes-Sapan Bhatia <sapan@corewars.org>,
        Robert Love <rlove@google.com>, Rob Herring <robh@kernel.org>,
        Roland Stigge <stigge@antcom.de>,
        Russell King <linux@armlinux.org.uk>,
        Russell King <rmk@arm.linux.org.uk>,
        Russ Gorby <russ.gorby@intel.com>,
        Stanislav Voronyi <stas@cnti.uanet.kharkov.ua>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH 00/36] Rid W=1 issues from TTY
Message-ID: <20201106095450.GA2660312@kroah.com>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104193549.4026187-1-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 04, 2020 at 07:35:13PM +0000, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.

Many of these now applied, please update the series against my
tty-testing branch and resend the rest.

thanks,

greg k-h
