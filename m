Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48B82DF64A
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 18:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgLTRYP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 12:24:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727112AbgLTRYP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 12:24:15 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC46C061282
        for <linux-media@vger.kernel.org>; Sun, 20 Dec 2020 09:23:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07A2345E;
        Sun, 20 Dec 2020 18:23:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608485013;
        bh=CFKPdteRGWvYlP26u1/0sQHEhDKwkGuuq6s7UNpRfFQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TTmWYlcXqGKSCQPK9md47lgtU6Xl/+EqzGNWsO+H1B83/0HGBl934IdFkloOa6JUa
         WKqa7rJJ6qy9rBvctcgKFNrm5rlHBQ/SrS4gSLy5HZ+pFHRUWp+kkah0dtxU43kBcI
         EIMwkrQx8B/vmZ2zCGM69FZ0BeqWQw+Fyphqk3wI=
Date:   Sun, 20 Dec 2020 19:23:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Speckenheuer <daniel.speckenheuer@gmx.de>
Cc:     linux-media@vger.kernel.org
Subject: Re: Logitech C922 Pro HD Stream Webcam
Message-ID: <X9+IjU78PGgL3r1o@pendragon.ideasonboard.com>
References: <trinity-3f9b91b4-9d40-4a88-ad57-daeb25d2fc4b-1608483504874@3c-app-gmx-bap54>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <trinity-3f9b91b4-9d40-4a88-ad57-daeb25d2fc4b-1608483504874@3c-app-gmx-bap54>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Sun, Dec 20, 2020 at 05:58:24PM +0100, Daniel Speckenheuer wrote:
> Hello,
> 
> the current C922 model from Logitech is missing from the table of
> known UVC devices.
> 
> Please complete the model and let me know whether this works without
> problems under Linux or whether problems are to be expected here.

I don't own a C922. If you get one, you can report whether it works fine
or if issues are encountered :-) I wouldn't expect any issue, recent
Logitech devices should work fine.

> Thank you and best regards from Germany!
> 
> Daniel Speckenheuer

-- 
Regards,

Laurent Pinchart
