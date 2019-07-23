Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9667871468
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 10:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731828AbfGWIv5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 04:51:57 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:46293 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730819AbfGWIv5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 04:51:57 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id pqWWhu57RLqASpqWZhIB4l; Tue, 23 Jul 2019 10:51:56 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC] Removal of drivers/staging/media/bcm2048
Message-ID: <e78d190f-5185-f37a-c212-b88af2198f55@xs4all.nl>
Date:   Tue, 23 Jul 2019 10:51:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJcUsqLDY4tIYCaK9/+AoYqECqwOG/RkWzZB+iJdaaCpCytTdD7gDECYAp8o1yAOiY65lEojvaj1WKMip62fCb91MAvUXs7cuRrrARJ35W+MqkQTgSM9
 oVneIpPfjdsQ0iossvLMGrzfyy6cHrxCbevgFdJcenELSxhA1KhXoCY7H8pR+1MEHV5WYi7Lblk921rlFz9aPGSTmnCnEiDvqj1omP1kMJX+D20dALhtg/Ae
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This staging driver is now almost 6 years old, but hasn't seen any real
development for a long time.

I think it is time to remove it, unless someone plans to do work on this
in the near future.

If anyone wants to work on this, please let us know.

Regards,

	Hans
