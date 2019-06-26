Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEB656629
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 12:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfFZKD4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 06:03:56 -0400
Received: from retiisi.org.uk ([95.216.213.190]:38880 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725379AbfFZKD4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 06:03:56 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 5AF2D634C7F;
        Wed, 26 Jun 2019 13:03:47 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hg4mI-0000QF-ND; Wed, 26 Jun 2019 13:03:46 +0300
Date:   Wed, 26 Jun 2019 13:03:46 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Eugen.Hristev@microchip.com
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] media: atmel: atmel-isc: fix and cleanup
 potential bugs
Message-ID: <20190626100346.4spzeuhkgkrscmdx@valkosipuli.retiisi.org.uk>
References: <1560340575-21021-1-git-send-email-eugen.hristev@microchip.com>
 <1560340575-21021-3-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560340575-21021-3-git-send-email-eugen.hristev@microchip.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 12, 2019 at 12:00:35PM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Fixed issues that can lead to potential bugs.
> Cleanup order in the driver
> Taking into consideration std control creation can fail
> mutex_destroy call
> changing controller_formats with const specifier
> some cosmetic cleanups
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
