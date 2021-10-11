Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 821B84286C5
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 08:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234080AbhJKG0O convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 11 Oct 2021 02:26:14 -0400
Received: from ni.piap.pl ([195.187.100.5]:55596 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234022AbhJKG0N (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 02:26:13 -0400
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        "joe@perches.com" <joe@perches.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
References: <m3fstfoexa.fsf@t19.piap.pl>
        <YV3YkXAKxiLmPYwL@valkosipuli.retiisi.eu> <m3zgrlkxn6.fsf@t19.piap.pl>
        <20211009090749.hujuwamgkjw2tfcx@uno.localdomain>
        <a8bd12e5-cdb5-ee85-d0a9-03ede990f5d2@infradead.org>
        <YWH83W8uVbU6RzVe@valkosipuli.retiisi.eu>
Date:   Mon, 11 Oct 2021 08:24:12 +0200
In-Reply-To: <YWH83W8uVbU6RzVe@valkosipuli.retiisi.eu> (Sakari Ailus's message
        of "Sat, 9 Oct 2021 23:34:37 +0300")
Message-ID: <m3r1cskrjn.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari Ailus <sakari.ailus@iki.fi> writes:

>> http://lkml.iu.edu/hypermail/linux/kernel/1607.1/00627.html
>
> That's not really a statement for C++ (//) comments as it's against other
> /* ... */ multi-line comment styles some of which are used by the
> networking stack.

It appears it's about both multi-line and single-line comments, though:
(c)
// This can be a single line. Or many. Your choice.
                 ^^^^^^^^^^^
-- 
Krzysztof "Chris" Hałasa

Sieć Badawcza Łukasiewicz
Przemysłowy Instytut Automatyki i Pomiarów PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
