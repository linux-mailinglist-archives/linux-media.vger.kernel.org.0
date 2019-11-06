Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 621F7F14D1
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 12:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731267AbfKFLSJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 06:18:09 -0500
Received: from cnc.isely.net ([75.149.91.89]:38739 "EHLO cnc.isely.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727391AbfKFLSJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 06:18:09 -0500
X-Greylist: delayed 309 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Nov 2019 06:18:08 EST
Received: from ts3-dock2.isely.net (ts3-dock2.isely.net [::ffff:192.168.23.14])
  (AUTH: PLAIN isely, TLS: TLSv1/SSLv3,256bits,DHE-RSA-AES256-GCM-SHA384)
  by cnc.isely.net with ESMTPSA; Wed, 06 Nov 2019 05:12:58 -0600
  id 00000000001426BE.000000005DC2AABA.00004E8C
Date:   Wed, 6 Nov 2019 05:12:51 -0600 (CST)
From:   Mike Isely <isely@isely.net>
To:     Hans Verkuil <hverkuil@xs4all.nl>
cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Isely <isely@isely.net>
Subject: Re: [PATCH] pvrusb2: Fix oops on tear-down when radio support is
 not present
In-Reply-To: <5491a24e-e41a-5d11-7ac5-6d6804989550@xs4all.nl>
Message-ID: <alpine.DEB.2.21.1911060511360.31133@sheridan.isely.net>
References: <alpine.DEB.2.21.1911052034300.31133@sheridan.isely.net> <5491a24e-e41a-5d11-7ac5-6d6804989550@xs4all.nl>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Thanks for spotting that.  I think I had eliminated the from header 
because I thought I was seeing a duplicate from header and didn't want 
to cause confusion.  That'll teach me.

It's been reposted.

  -Mike

On Wed, 6 Nov 2019, Hans Verkuil wrote:

> Hi Mike,
> 
> For some reason your mailer didn't include a "From:" line, only a "Reply-To:"
> line. This means that the patch authorship is not detected by patchwork and
> git. Can you repost with a valid From: line in the email header?
> 
> Thanks!
> 
> 	Hans
> 

[...]

-- 

Mike Isely
isely @ isely (dot) net
PGP: 03 54 43 4D 75 E5 CC 92 71 16 01 E2 B5 F5 C1 E8
