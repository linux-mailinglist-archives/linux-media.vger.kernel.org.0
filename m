Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71252633A7
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 19:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgIIRIG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 13:08:06 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:51891 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730394AbgIIPhD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Sep 2020 11:37:03 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id G0kJkjPcoXgwIG0kKkZggK; Wed, 09 Sep 2020 16:06:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599660408; bh=oPrFl/TwIvpVNpQ11j9+60pYM+n2ln10KTC8JKR4WbA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=S4SA8z+znzkwPxIJSUD15tOO5/tLQ6uyZyT8lVxO4TwZ+NwZxqYV5R0Q4lBJg2YXX
         4HAhlrwqHrWeMbwd5HyxPYkXg0CqeBGQdnrmtdH5vxGSxQnKhLYMGEZ5CFkVeYlpZe
         aWcLQoXVXFA/ySFah+HyFZaP9cc2ACsJiDtsX+5q8v4QawL3ljYNk+RO7Q6KiXVGrd
         Ghcy3euewZlfVUsnno9rFvjzu2ze4ysAsBCUZmCZwIwPQSXeur5zrQlGRqmNm6et4d
         t15Jw5Q20+7UDi2FMOq/47qoakUi73aWwGllyQSDek0xuwsanhvhdHiEkPs8mpynLX
         cfrWoDc8TI5Xw==
Subject: Re: [PATCH 2/3] media: Add support for the AM/FM radio chip KT0913
 from KT Micro.
To:     Santiago Hormazabal <santiagohssl@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20200831220601.20794-1-santiagohssl@gmail.com>
 <20200831220601.20794-3-santiagohssl@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <60e1d448-2c79-2642-7fb6-82aceacdb75f@xs4all.nl>
Date:   Wed, 9 Sep 2020 16:06:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200831220601.20794-3-santiagohssl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBGtO1zVijWQzDMb2IpWJbNPvzETDnfTgb43UKoKnwaY0otSN+Sz/6bzbgwUBZNdeghs/Bedcx8wmruysTJ5Tftxj4trdcE3jKaLLjCFuKE0EizMQQu2
 b4AcZHRP1AT9oEzCmI9EE2qYbDRzETU0dF9wiDtpskjRw+lh5eQIfJPX8cbMCkPzphOtzvCp7yQax+P0Q2vfVDqo5PUhysE3fl9Mgh6eLMRS2NUmhefy21kl
 DfgUS3/9OjdmmugYGZYKwLuTgvj2nLsYV2q8jnfOdICXQgvn1JVv2BwSKG/Lt9/HCa2n5/riOiKo/5j4sG+/NULvzKBVGQwmWxQ8iGBPuMnvbPYiWNGWQrk8
 HCISZQGegKeFGT8gc4AF+jxqHhjKyXv1umRD3GgBYLRtSUSG7Dg+Iua796Rrq+qnqtWaVYw2s8OD9IaHKXLjTQL63o/KYi2JzT68jAKQlmtfZiAzm7e9106u
 vCx3GiLfuPbW+S3B
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Santiago,

On 01/09/2020 00:06, Santiago Hormazabal wrote:
> This chip requires almost no support components and can used over I2C.
> The driver uses the I2C bus and exposes the controls as a V4L2 radio.
> Tested with a module that contains this chip (from SZZSJDZ.com,
> part number ZJ-801B, even tho the company seems defunct now), and an H2+
> AllWinner SoC running a kernel built off 07d999f of the media_tree.
> 
> Signed-off-by: Santiago Hormazabal <santiagohssl@gmail.com>
> ---
>  drivers/media/radio/Kconfig        |   10 +
>  drivers/media/radio/Makefile       |    1 +
>  drivers/media/radio/radio-kt0913.c | 1196 ++++++++++++++++++++++++++++
>  3 files changed, 1207 insertions(+)
>  create mode 100644 drivers/media/radio/radio-kt0913.c

One more thing: you need to add an entry to the MAINTAINERS file for this
driver. It can either be part of this patch, or added in a separate patch.

Regards,

	Hans
