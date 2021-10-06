Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7680142374C
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 06:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhJFE6o convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Oct 2021 00:58:44 -0400
Received: from ni.piap.pl ([195.187.100.5]:40784 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229554AbhJFE6o (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Oct 2021 00:58:44 -0400
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Saravana Kannan <saravanak@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: v5.15-rcX regression: video devices on i.MX6 are not created
References: <m3lf39nfsq.fsf@t19.piap.pl>
        <CAGETcx_N7XYkzFPSuQdvWKk1o+Pzzg4HnzChE_4c_Bg_oOK3eA@mail.gmail.com>
        <CAOMZO5DwcXUe5j97n4Q_RF9WRo2DYoToe7FLNbpDJhn_BxuH0w@mail.gmail.com>
Date:   Wed, 06 Oct 2021 06:56:48 +0200
In-Reply-To: <CAOMZO5DwcXUe5j97n4Q_RF9WRo2DYoToe7FLNbpDJhn_BxuH0w@mail.gmail.com>
        (Fabio Estevam's message of "Tue, 5 Oct 2021 23:23:38 -0300")
Message-ID: <m38rz6oinj.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio, Saravana,

Fabio Estevam <festevam@gmail.com> writes:

>> > FYI the patch: 6b2117ad65f1bca9ece6d4b1ee784b42701a2d86
>> >
>> > of: property: fw_devlink: Add support for "resets" and "pwms"
>> >
>> > Allows better tracking of dependencies between devices.
>> >
>> >  drivers/of/property.c | 4 ++++
>> >
>> > breaks v4l2 video devices on an i.MX6 CPU. The /dev/video* nodes are not
>> > created, and the drivers (async subdevicess) are "waiting":
>
> Phillip has sent a fix for this issue:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2021-October/687868.html

This patch makes the /dev/video* devices to show up on my i.MX6-based
system again, so I consider the problem fixed. Thanks.
-- 
Krzysztof "Chris" Hałasa

Sieć Badawcza Łukasiewicz
Przemysłowy Instytut Automatyki i Pomiarów PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
