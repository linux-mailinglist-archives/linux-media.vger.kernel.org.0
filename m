Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46BFF36EE2B
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 18:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233622AbhD2QcX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 12:32:23 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:34024 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233302AbhD2QcX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 12:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619713884; bh=jnDjuBdvcge6hG7aJnUUqA4yfq3eRaRQunAeAIsLQus=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
         Content-Type;
        b=B2HgiMv1D1CDr2u2jRQ0C5YE4ur0pDp7QRj4tCjnwdD2bIKv0yporzp6onDIT798C
         NcTxyIj0u9yn8Dwv2O9hB55HL09AhGXx+Y2plMF04BVx3rLggc+A+8erLXUt6ZVoi5
         y0wIb4d759b4Fb3sVWUNIfD/E3idk5RfjDXiNcxg=
Received: by 192.168.90.16 [192.168.90.16] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Thu, 29 Apr 2021 18:31:23 +0200 (CEST)
X-EA-Auth: TrpmWUDgsDbj3qSCAUfJ9Msd+EYOVPSOoBamqPPQkcNmyZyXBtb9rieyhdGjqBtwgVRxL8MUzWxdx6OYSTaOUYvrWewoNurT
Date:   Thu, 29 Apr 2021 22:01:16 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: code clean up confirmation => staging: media: atomisp: pci driver
Message-ID: <YIrfVFhW8ufjm/tB@192.168.1.8>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello All,
Is anyone already working on code clean up of the following driver
/files? I am specifically targeting addressing the checkpatch
complaints. Let me know.

	drivers/staging/media/atomisp/pci


Thank you,
deepak.


