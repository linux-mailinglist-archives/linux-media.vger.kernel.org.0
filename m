Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 867F17144B
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 10:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728417AbfGWIqV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 04:46:21 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:37201 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727076AbfGWIqV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 04:46:21 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id pqR5hu2i9LqASpqR9hI8UN; Tue, 23 Jul 2019 10:46:20 +0200
To:     Prabhakar Lad <prabhakar.csengg@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC] Removal of drivers/staging/media/davinci_vpfe
Message-ID: <93050d86-ec75-8394-4fdb-6a06ebb5ce6b@xs4all.nl>
Date:   Tue, 23 Jul 2019 10:46:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDhdgyMc44i5mkqYY8d9ZMbskCJXl1B8+XDegFTXwBZNsoCbWL4I7C45ViQLd6Qb6aRhvoPW0xRZiFbWD2J1/GZXbvotxO2BrhKvUUWLvzKqf6GJISOc
 p8MSzp4w0XKobM1saFKP2Zrm/qRlVYAXKbOpP/1wduIn4HDgvHmnaVzOGkE4m6d7OvU0PrY2Ii1A5bF66Sj1uLU5aEvVtC30PfU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

This staging driver is now almost 7 years old, but hasn't seen any real
development for a long time.

I think it is time to remove it, unless you plan to do work on this.

What do you think?

Regards,

	Hans
