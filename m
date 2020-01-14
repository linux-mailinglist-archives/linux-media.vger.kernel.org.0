Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2D6613A75F
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 11:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbgANK1A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jan 2020 05:27:00 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:43113 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725820AbgANK07 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jan 2020 05:26:59 -0500
Received: from [IPv6:2001:420:44c1:2577:11b:d594:936e:b16a]
 ([IPv6:2001:420:44c1:2577:11b:d594:936e:b16a])
        by smtp-cloud7.xs4all.net with ESMTPA
        id rJPSiufIVrNgyrJPVixhCH; Tue, 14 Jan 2020 11:26:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578997618; bh=yM9x4oLiJYmJEUneY8lr+ZnckOuJNwJnfgp92Y9VMwQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IDl3Q7NEDTYd9EdbfyEBAFBdn2FVjUh83aNttNOw+95fm70a0a6XoVNwg5mUYpoCC
         f3KAxPtRFnTrsSFsuXdI4j4bdIXB2eVKer9LkPY9WH2/bOjuzIaz7OB2vAlXIA4N+t
         TrvKXxqxT8NgZvbxOrh5KIO3ezYcjmbwVvqt8v/9WeoKzPBNR5mCEu0eBCxf0iDNSs
         oCUWDRhcF3tq0f+CsawNVrT6mZCchoLXcfiIU2gNN8L0DkqfOts/jU7dLGzmRn1TmF
         WOdYVOB/4v1d2yP94KK9AfP9gEX7Iapemt5WD9YT2GAOSt8UUFxG3viSUGQBC63Q01
         qtXZW6MfYAN5w==
Subject: Re: [PATCH v4 5/6] media: mc-devnode.c: set devnode->media_dev to
 NULL upon release instead of unregister
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        skhan@linuxfoundation.org, kernel@collabora.com, dafna3@gmail.com
References: <20200113215506.13329-1-dafna.hirschfeld@collabora.com>
 <20200113215506.13329-6-dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <207ca066-51e5-1df8-2393-5bbe543c30a2@xs4all.nl>
Date:   Tue, 14 Jan 2020 11:26:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200113215506.13329-6-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfB9hf7zJxY2vgGqmiUqX5yFD1Oq6RSPFw8HlBiPyvP4pteAO0kUTeDSLwnZNUIxXxnY6E6RZ39pr2Zou1O5FWgsV6T8fL4RqullYfei8qXK0mYJ05AFO
 NPg+BaIuPf8JZSmk/QbLItCt8FRiKeGJO8K1T9kIfb6rVfSzUUET8EGGrvxkBCqQoAp8WJ/EbbIE8VdZFDn0ywLHYvKdbkvi10oQQAkfDkQC3tLtF08eSB3C
 36YnQBdMsWCPWAQPBx4uX7oD16OZfkqXncArOALA1bz/UYEO72GOBHHgBKLu+02bhHlQLXz8Dm28Z/ckjKhFcU4wYrrT89dyThcyU9cHfoTQqN30T9fD2lHN
 Us4aqmRzHu86+xrJP15EEmYJwYX41H435NeMoXG41IOKl96Vwi82yhV2NMXTEuRTsAM/Hz4+b398Cm+3UuSe/OlM4YnYfMj0YrO0W1e5ClZZcADfdXxgVnUL
 3bDRuTAb7GgERCsIlhrhK5XGVqo4s85FrQzypg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/13/20 10:55 PM, Dafna Hirschfeld wrote:
> media_devnode_release calls a release callback. Currently none of
> the drivers implement that callback but in the future the vimc
> driver and maybe others might add implementation for it.
> The release callback will want to access the driver's private data
> by using 'container_of(devnode->media_dev' therefore media_dev
> should be set to NULL only when the release callback returns.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/media/mc/mc-devnode.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index f11382afe23b..388c9051152a 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -58,7 +58,7 @@ static void media_devnode_release(struct device *cd)
>  	/* Release media_devnode and perform other cleanups as needed. */
>  	if (devnode->release)
>  		devnode->release(devnode);
> -
> +	devnode->media_dev = NULL;

This makes no sense since you free the whole devnode in the next line.

Regards,

	Hans

>  	kfree(devnode);
>  	pr_debug("%s: Media Devnode Deallocated\n", __func__);
>  }
> @@ -283,7 +283,6 @@ void media_devnode_unregister(struct media_devnode *devnode)
>  	mutex_lock(&media_devnode_lock);
>  	/* Delete the cdev on this minor as well */
>  	cdev_device_del(&devnode->cdev, &devnode->dev);
> -	devnode->media_dev = NULL;
>  	mutex_unlock(&media_devnode_lock);
>  
>  	put_device(&devnode->dev);
> 

