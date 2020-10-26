Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5409B2986A7
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 06:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1770019AbgJZF4D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 01:56:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:51690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1770010AbgJZF4D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 01:56:03 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 89E0020878;
        Mon, 26 Oct 2020 05:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603691763;
        bh=ewAGu9XGiyCMERyz1NqrIy2Sc1xkpZLSvsK08tnfKbM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=euO+WHSHIYkx0BLD/yarcWGRbAryOdcJXV8a12BLQoqJN2cEHN3rYhDGfy+lejDrN
         Fmi/gWxxZaPSDd0eZl/7rxyUHgKZtf7EAJCCLlaQI3pqf07Aj+e5upHTR10spRPofo
         MifuqBkxRTevnzLuJxXdIsoeYpifKlA06prrZb/w=
Date:   Mon, 26 Oct 2020 06:56:31 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Deepak R Varma <mh12gx2825@gmail.com>
Cc:     outreachy-kernel@googlegroups.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v5 1/2] staging: media: imx: remove commented code
Message-ID: <20201026055631.GA779791@kroah.com>
References: <9fd1e7dd9e8f944b520f2a789e66e458aeb7b555.1602869338.git.mh12gx2825@gmail.com>
 <20201026040017.GA5074@my--box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026040017.GA5074@my--box>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 26, 2020 at 09:30:17AM +0530, Deepak R Varma wrote:
> On Fri, Oct 16, 2020 at 11:10:33PM +0530, Deepak R Varma wrote:
> 
> Hello All,
> Request for review / ack of this patch.

Please never top-post :(

The merge window only opened up a few hours ago, give maintainers time
to get to patches (like 2 weeks now).  Also remember, for the outreachy
project, drivers/staging/media/ patches are not considered and take much
longer to get reviewed and accepted, as the outreachy documentation
states.

good luck!

greg k-h
