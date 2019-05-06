Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7A2214865
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 12:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbfEFKg5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 06:36:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:54988 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725861AbfEFKg5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 May 2019 06:36:57 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6DB26AD33;
        Mon,  6 May 2019 10:36:56 +0000 (UTC)
Message-ID: <1557138995.12778.4.camel@suse.com>
Subject: Re: [PATCH] uvc: fix access to uninitialized fields on probe error
From:   Oliver Neukum <oneukum@suse.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org
Date:   Mon, 06 May 2019 12:36:35 +0200
In-Reply-To: <20190502114344.GP4888@pendragon.ideasonboard.com>
References: <20190430122814.24986-1-oneukum@suse.com>
         <20190502114344.GP4888@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Do, 2019-05-02 at 14:43 +0300, Laurent Pinchart wrote:
> Let's capitalise the comment and end it with a period to match the rest
> of the driver. With these small issues fixed,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hi,

thank you. I agree with them.

	Regards
		Oliver

