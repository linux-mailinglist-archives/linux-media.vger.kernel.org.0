Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 922675870C
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 18:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbfF0Q2X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 12:28:23 -0400
Received: from retiisi.org.uk ([95.216.213.190]:52788 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726465AbfF0Q2X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 12:28:23 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 17F58634C7B;
        Thu, 27 Jun 2019 19:28:10 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hgXFp-0000bV-C2; Thu, 27 Jun 2019 19:28:09 +0300
Date:   Thu, 27 Jun 2019 19:28:09 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        todor.tomov@linaro.org, ezequiel@collabora.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: ov5645: Remove unneeded
 regulator_set_voltage()
Message-ID: <20190627162809.hnj3rnpbquema52l@valkosipuli.retiisi.org.uk>
References: <20190626235614.26587-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190626235614.26587-1-festevam@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Wed, Jun 26, 2019 at 08:56:13PM -0300, Fabio Estevam wrote:
> There is no need to call regulator_set_voltage() for each regulator
> that powers the camera.
> 
> The voltage value for each regulator should be retrieved from the
> device tree, so remove the unneeded regulator_set_voltage().
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Thanks for the patchset.

I wonder if there are chances of this breaking something as the driver did
not depend on the voltage being set correctly in DT. But we don't seem to
have any users in DT source shipped with the kernel. So I guess I'll merge
these at least if no-one complains (see the comment on the 2nd patch, too).

No other sensor (I²C) driver appears to be touching the regulator voltage
either.

-- 
Regards,

Sakari Ailus
