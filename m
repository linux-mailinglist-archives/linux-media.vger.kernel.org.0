Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79B512E36C8
	for <lists+linux-media@lfdr.de>; Mon, 28 Dec 2020 12:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgL1LzM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Dec 2020 06:55:12 -0500
Received: from mx2.suse.de ([195.135.220.15]:60422 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726603AbgL1LzM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Dec 2020 06:55:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1609156465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WG4xhXQYAczlY0vFiOrBXXA0TnTJFStA1UMY67oHyQ0=;
        b=eHDfIlI5bzYKS1yXhTEsHix18HPkct5wllAFHfNNZIHoInj0VWjFmryTTqbf7L5TxtM4gg
        7/1chnPmsifRVHJ+oqKGPBIuyLopCZb9hyPM5Ynj9n7hp3i2eNc26cFnzS/sAFCy/dZ+1Q
        v4JOIu8lw9u/7aAylVEeq1tiYfYOZpc=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5E57CAB8B;
        Mon, 28 Dec 2020 11:54:25 +0000 (UTC)
Message-ID: <f00f7739d0b796a3ba2a36ae462e49a806e17843.camel@suse.com>
Subject: Re: [PATCH 2/2] cdc-acm: blacklist another IR Droid device
From:   Oliver Neukum <oneukum@suse.com>
To:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Georgi Bakalski <georgi.bakalski@gmail.com>
Date:   Mon, 28 Dec 2020 12:53:57 +0100
In-Reply-To: <20201227134502.4548-2-sean@mess.org>
References: <20201227134502.4548-1-sean@mess.org>
         <20201227134502.4548-2-sean@mess.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Sonntag, den 27.12.2020, 13:45 +0000 schrieb Sean Young:
> This device is supported by the IR Toy driver.
> 
> Reported-by: Georgi Bakalski <georgi.bakalski@gmail.com>
> Signed-off-by: Sean Young <sean@mess.org>
Acked-by: Oliver Neukum <oneukum@suse.com>

