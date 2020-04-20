Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06A0A1B0935
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 14:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgDTMTs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 08:19:48 -0400
Received: from gofer.mess.org ([88.97.38.141]:36095 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726287AbgDTMTr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 08:19:47 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1792BC638A; Mon, 20 Apr 2020 13:19:43 +0100 (BST)
Date:   Mon, 20 Apr 2020 13:19:42 +0100
From:   Sean Young <sean@mess.org>
To:     Gregor Jasny <gjasny@googlemail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Rosen Penev <rosenp@gmail.com>,
        Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Subject: Re: How about a v4l-utils-1.20 release?
Message-ID: <20200420121942.GA22485@gofer.mess.org>
References: <818465d4-3665-5af0-0136-2090edbb4eb1@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <818465d4-3665-5af0-0136-2090edbb4eb1@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gregor,

On Mon, Apr 20, 2020 at 02:05:07PM +0200, Gregor Jasny wrote:
> Hello,
> 
> It's been a while since we released v4l-utils 1.18. How about a 1.20
> release?
> 
> Do you have anything that should go in before?

There is nothing from me. There are few patches on the list from Rosen Penev,
cleaning up various stuff found with clang.

Otherwise I guess there is the meson build system, but I don't know how far
out that is.

Thanks,

Sean
