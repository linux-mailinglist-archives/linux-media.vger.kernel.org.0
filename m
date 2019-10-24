Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E665E3A48
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 19:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390020AbfJXRnf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 13:43:35 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38769 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729458AbfJXRnf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 13:43:35 -0400
Received: by mail-lj1-f195.google.com with SMTP id q78so10840501lje.5
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2019 10:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bjdUKzEAyKq+/YnyS8YNpoEEndslIyn4XXinnzGbGDg=;
        b=L2hzs8nG8qLrtAFQ1jaY2Q4FPmhb1nBcIN9YI95x7zect0snu6z3w+2fB0cXVVUhKO
         DcqipMc25Ltx47EQuGZ9OkDCLh7pt0/YfzZHwyzxDgTP/GG/gjMPONlkNw0SbITEQk5q
         xRoMjRKMIBOxRkETUwrMKajYiiiSjI4HMPjGpeZi/efLZvneO9g6m1NXtdHvjPoyqdpx
         i0yvaK2sZnc1lnDkPsHwo6fCDg385YuMWXrWzjl7cYDE4PDCpkItFIlb3ByR1ZSTpu9A
         JFjTmaHNIYwPEq5jOm/zdh4S0JocZgvFFWs/fmeD7xl0a616muGcmQ83mXJv2gR0zBe2
         BLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bjdUKzEAyKq+/YnyS8YNpoEEndslIyn4XXinnzGbGDg=;
        b=IygpFupgp8y/IHfEvLgFq76I7JsAsaySqJcHsuqZmfM4nJ7HTsxFsE80WbOFaKue9P
         KsJnZOsITaNMvkQeMmMNnFIU5Z0OgpOvCbmgPrEWR0HPB6SovfaIHrbzsNeouOA7tGz3
         uHR98TmW/yUX4xtz0HEKrCwidgH4IAeqliG/6rnW+4sUTeiYzWatcfdWyAMCV62yWFY1
         reMZlY2hTcQHxKFhU9Z+O3OmFJotO4iJpLNDGGylA00iY4DuC+MDE/igAkwiPW8WNrKJ
         p+sdmVRb2cNePO6hR8qg1LuGSAYANH6qe+u7VDVyEYrooD4Va2RHiEpf5G+s5p/aBrr1
         NguA==
X-Gm-Message-State: APjAAAUcVS44vYnqeLCVTfguCzreQiIGlbTy9+LNwwAvPfUGUg7EdCZC
        OlCdE142ecgfde3Pp/E3zWJjOh1NQwZ9QeRK/6w=
X-Google-Smtp-Source: APXvYqwW2Ut4Up3wCbk0UIABUOD94Cmm5TDRultbDCQvj6MsJ6K+2h9UzywiPLwb/Sr+LN6j5EHxh7q9KvS5nMYtmtk=
X-Received: by 2002:a2e:9e1a:: with SMTP id e26mr26855267ljk.17.1571939012968;
 Thu, 24 Oct 2019 10:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com> <20191024004155.32068-2-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20191024004155.32068-2-laurent.pinchart@ideasonboard.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 24 Oct 2019 14:43:33 -0300
Message-ID: <CAOMZO5C26mtWCOE_5griYunN=PZ=dFFs5B--ADoVmKqur1yMUw@mail.gmail.com>
Subject: Re: [PATCH 1/7] media: imx: imx7_mipi_csis: Power off the source when
 stopping streaming
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Oct 24, 2019 at 2:41 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The .s_stream() implementation incorrectly powers on the source when
> stopping the stream. Power it off instead.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Should this one have a Fixes tag?

Thanks
