Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7A822049AD
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 08:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730682AbgFWGPZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 02:15:25 -0400
Received: from verein.lst.de ([213.95.11.211]:37815 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730515AbgFWGPY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 02:15:24 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 7F48A68B02; Tue, 23 Jun 2020 08:15:20 +0200 (CEST)
Date:   Tue, 23 Jun 2020 08:15:19 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 1/2] media: omap3isp: Remove cacheflush.h
Message-ID: <20200623061519.GA32219@lst.de>
References: <20200622234740.72825-1-natechancellor@gmail.com> <20200622234740.72825-2-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622234740.72825-2-natechancellor@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
