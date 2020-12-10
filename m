Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8AB2D56E6
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 10:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732271AbgLJJU1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 04:20:27 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:60545 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730983AbgLJJUZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 04:20:25 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id nI6okc0mkkpopnI6tkaoyW; Thu, 10 Dec 2020 10:19:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1607591979; bh=Hzd2nJZK/krPgmjKFBSUAetg6WF9qGW8IV6Rhr6mRps=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hM9i9A1ySOcnx66fgfCy0m5SI2Kyva/OFEQBoJfC/EnYP5j6fpnFWuqNp63CllwJ9
         i24hCun1wNAAPwL6SH3ulwimGbpEb+Ln9aygIXPLeg9EEBEZk2Gr5AUP2E9w11chHC
         s4iYUtGNjv0Klp8qdEBXvZdOM+IeUda1npKoJKMJaATx1LgHrHKwa/L8uX1Zebr19L
         o/dhkTYMaaJmS5BV5AqK/05M0Oe5+6pwDr6NIMgdzOeCwbqneOgQqxEOmRKSctz7Qr
         +0DlkJ/mDUQ8/CCR+o1DlE8N0uaxN4PwIaFDKLtWyNG1iI9nZ4aiWDiiPzDTQHJPzP
         Erzsw7ZP3ohRA==
Subject: Re: HEIC encoder/decoder
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>
References: <5c5cd205-5c7f-1450-1f84-7d0e573dc90f@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fcc1f01b-8dbf-bb6e-87d5-95a484261dc7@xs4all.nl>
Date:   Thu, 10 Dec 2020 10:19:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5c5cd205-5c7f-1450-1f84-7d0e573dc90f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfE75mDPpKDvYZGTYHjUsrbUMnU3HCi9ihX2zBf3VdbxRSrIh79qevhMsk1g/fFawTVm2ZRDw/RJo+pd7LRn5Ph+Ha5dzoL8g4Clzd7twS9d356xUF41p
 o4OTz15ERxPL39/fIM3HK38xkVyLd/gu+BsHx+bAanlpt7bwAKCCdelh7GGEhAREr1Gh80s2GPraS8t0Q+AGI921HJBCygrF8zql3Rp0nsKA/+JmiV0AmSYr
 W1mPqgeQvZo0TH8R5FN7Nr9zeVu2M1KT6Hbd9KQbK0A=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/12/2020 00:10, Stanimir Varbanov wrote:
> Hello,
> 
> I have to implement HEIC image encoder (and later decoder) in Venus
> driver and I wonder how to distinguish image vs video encoding using
> HEVC and possibly AVC codecs.
> 
> I could imagine those two options:
> 
> * introduce a new compressed format V4L2_PIX_FMT_HEVC_IMAGE and reuse
> video encoder as of now, or

This option seems to be the correct one. It is also in line with how JPEG
is used.

I wonder if it should be called V4L2_PIX_FMT_HEIC instead, but it's not
entirely clear to me from the wikipedia page what that makes sense or not.

> 
> * make a separate video node which supports HEVC with profiles Main
> Still Picture and Main 10 Still picture only. The problem here is that
> AVC doesn't provide profiles for still pictures, and in this case the
> driver cannot distinguish what the client wants video or image
> encoding/decoding.

That's too messy. A separate pixel format for still images works well.
There is a huge difference between HEVC and HEIC since with HEIC each
frame (like JPEG) is independently encoded/decoded, so the driver behaves
differently. It makes perfect sense to use a separate pixel format for this.

Regards,

	Hans

> 
> It is a bit more complicated but I'd like to receive comments / ideas at
> what would be the best way.
> 

