Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDEEC1A167
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 18:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbfEJQZ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 12:25:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39562 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfEJQZ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 12:25:29 -0400
Received: from [IPv6:2a02:c7f:1887:5d00:441c:7edf:7614:409b] (unknown [IPv6:2a02:c7f:1887:5d00:441c:7edf:7614:409b])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F1E82DF;
        Fri, 10 May 2019 18:25:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557505527;
        bh=Gj5pAB4saNBi9iWDk6JjMFXoNWlzw8tU5bUrF50NFuE=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Witk/hgUi20PDDwUG/GBIp75GIlirfzzOhS/QvzPZDaJXvickM6xAamQJqLivtXd5
         6iPAHX04MmKHTVfigqKPWzn4UCOkGbNLQqXtVjxa47lUru8chkUjCgBlY7FCTrRCqZ
         GU1Vp8jSCToE9JMlxc8gvbvOW8h5AvRscZJdJJlM=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH] media: i2c: adv748x: initialize bit 7 of
 csi_tx_top_reg_1f
To:     Michael Rodin <mrodin@de.adit-jv.com>, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, michael@rodin.online,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <1557502240-16274-1-git-send-email-mrodin@de.adit-jv.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 mQINBFYE/WYBEACs1PwjMD9rgCu1hlIiUA1AXR4rv2v+BCLUq//vrX5S5bjzxKAryRf0uHat
 V/zwz6hiDrZuHUACDB7X8OaQcwhLaVlq6byfoBr25+hbZG7G3+5EUl9cQ7dQEdvNj6V6y/SC
 rRanWfelwQThCHckbobWiQJfK9n7rYNcPMq9B8e9F020LFH7Kj6YmO95ewJGgLm+idg1Kb3C
 potzWkXc1xmPzcQ1fvQMOfMwdS+4SNw4rY9f07Xb2K99rjMwZVDgESKIzhsDB5GY465sCsiQ
 cSAZRxqE49RTBq2+EQsbrQpIc8XiffAB8qexh5/QPzCmR4kJgCGeHIXBtgRj+nIkCJPZvZtf
 Kr2EAbc6tgg6DkAEHJb+1okosV09+0+TXywYvtEop/WUOWQ+zo+Y/OBd+8Ptgt1pDRyOBzL8
 RXa8ZqRf0Mwg75D+dKntZeJHzPRJyrlfQokngAAs4PaFt6UfS+ypMAF37T6CeDArQC41V3ko
 lPn1yMsVD0p+6i3DPvA/GPIksDC4owjnzVX9kM8Zc5Cx+XoAN0w5Eqo4t6qEVbuettxx55gq
 8K8FieAjgjMSxngo/HST8TpFeqI5nVeq0/lqtBRQKumuIqDg+Bkr4L1V/PSB6XgQcOdhtd36
 Oe9X9dXB8YSNt7VjOcO7BTmFn/Z8r92mSAfHXpb07YJWJosQOQARAQABtDBLaWVyYW4gQmlu
 Z2hhbSA8a2llcmFuLmJpbmdoYW1AaWRlYXNvbmJvYXJkLmNvbT6JAkAEEwEKACoCGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4ACGQEFAlnDk/gFCQeA/YsACgkQoR5GchCkYf3X5w/9EaZ7
 cnUcT6dxjxrcmmMnfFPoQA1iQXr/MXQJBjFWfxRUWYzjvUJb2D/FpA8FY7y+vksoJP7pWDL7
 QTbksdwzagUEk7CU45iLWL/CZ/knYhj1I/+5LSLFmvZ/5Gf5xn2ZCsmg7C0MdW/GbJ8IjWA8
 /LKJSEYH8tefoiG6+9xSNp1p0Gesu3vhje/GdGX4wDsfAxx1rIYDYVoX4bDM+uBUQh7sQox/
 R1bS0AaVJzPNcjeC14MS226mQRUaUPc9250aj44WmDfcg44/kMsoLFEmQo2II9aOlxUDJ+x1
 xohGbh9mgBoVawMO3RMBihcEjo/8ytW6v7xSF+xP4Oc+HOn7qebAkxhSWcRxQVaQYw3S9iZz
 2iA09AXAkbvPKuMSXi4uau5daXStfBnmOfalG0j+9Y6hOFjz5j0XzaoF6Pln0jisDtWltYhP
 X9LjFVhhLkTzPZB/xOeWGmsG4gv2V2ExbU3uAmb7t1VSD9+IO3Km4FtnYOKBWlxwEd8qOFpS
 jEqMXURKOiJvnw3OXe9MqG19XdeENA1KyhK5rqjpwdvPGfSn2V+SlsdJA0DFsobUScD9qXQw
 OvhapHe3XboK2+Rd7L+g/9Ud7ZKLQHAsMBXOVJbufA1AT+IaOt0ugMcFkAR5UbBg5+dZUYJj
 1QbPQcGmM3wfvuaWV5+SlJ+WeKIb8ta5Ag0EVgT9ZgEQAM4o5G/kmruIQJ3K9SYzmPishRHV
 DcUcvoakyXSX2mIoccmo9BHtD9MxIt+QmxOpYFNFM7YofX4lG0ld8H7FqoNVLd/+a0yru5Cx
 adeZBe3qr1eLns10Q90LuMo7/6zJhCW2w+HE7xgmCHejAwuNe3+7yt4QmwlSGUqdxl8cgtS1
 PlEK93xXDsgsJj/bw1EfSVdAUqhx8UQ3aVFxNug5OpoX9FdWJLKROUrfNeBE16RLrNrq2ROc
 iSFETpVjyC/oZtzRFnwD9Or7EFMi76/xrWzk+/b15RJ9WrpXGMrttHUUcYZEOoiC2lEXMSAF
 SSSj4vHbKDJ0vKQdEFtdgB1roqzxdIOg4rlHz5qwOTynueiBpaZI3PHDudZSMR5Fk6QjFooE
 XTw3sSl/km/lvUFiv9CYyHOLdygWohvDuMkV/Jpdkfq8XwFSjOle+vT/4VqERnYFDIGBxaRx
 koBLfNDiiuR3lD8tnJ4A1F88K6ojOUs+jndKsOaQpDZV6iNFv8IaNIklTPvPkZsmNDhJMRHH
 Iu60S7BpzNeQeT4yyY4dX9lC2JL/LOEpw8DGf5BNOP1KgjCvyp1/KcFxDAo89IeqljaRsCdP
 7WCIECWYem6pLwaw6IAL7oX+tEqIMPph/G/jwZcdS6Hkyt/esHPuHNwX4guqTbVEuRqbDzDI
 2DJO5FbxABEBAAGJAiUEGAEKAA8CGwwFAlnDlGsFCQeA/gIACgkQoR5GchCkYf1yYRAAq+Yo
 nbf9DGdK1kTAm2RTFg+w9oOp2Xjqfhds2PAhFFvrHQg1XfQR/UF/SjeUmaOmLSczM0s6XMeO
 VcE77UFtJ/+hLo4PRFKm5X1Pcar6g5m4xGqa+Xfzi9tRkwC29KMCoQOag1BhHChgqYaUH3yo
 UzaPwT/fY75iVI+yD0ih/e6j8qYvP8pvGwMQfrmN9YB0zB39YzCSdaUaNrWGD3iCBxg6lwSO
 LKeRhxxfiXCIYEf3vwOsP3YMx2JkD5doseXmWBGW1U0T/oJF+DVfKB6mv5UfsTzpVhJRgee7
 4jkjqFq4qsUGxcvF2xtRkfHFpZDbRgRlVmiWkqDkT4qMA+4q1y/dWwshSKi/uwVZNycuLsz+
 +OD8xPNCsMTqeUkAKfbD8xW4LCay3r/dD2ckoxRxtMD9eOAyu5wYzo/ydIPTh1QEj9SYyvp8
 O0g6CpxEwyHUQtF5oh15O018z3ZLztFJKR3RD42VKVsrnNDKnoY0f4U0z7eJv2NeF8xHMuiU
 RCIzqxX1GVYaNkKTnb/Qja8hnYnkUzY1Lc+OtwiGmXTwYsPZjjAaDX35J/RSKAoy5wGo/YFA
 JxB1gWThL4kOTbsqqXj9GLcyOImkW0lJGGR3o/fV91Zh63S5TKnf2YGGGzxki+ADdxVQAm+Q
 sbsRB8KNNvVXBOVNwko86rQqF9drZuw=
Organization: Ideas on Board
Message-ID: <26e001a0-298f-e23b-9e46-98e62a8399c2@ideasonboard.com>
Date:   Fri, 10 May 2019 17:25:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557502240-16274-1-git-send-email-mrodin@de.adit-jv.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Thank you for the patch,

Could the patch title be a bit better described? Perhaps:

media: i2c: adv748x: Correct EAV F-bit handling


On 10/05/2019 16:30, Michael Rodin wrote:
> According to pages 188 and 193 of the "UG-747: ADV7481 Reference Manual"
> [1], the bit 7 (FRAMENUMBER_INTERLACED) of the register csi_tx_top_reg_1f
> "sets association of frame number in the FS and FE packets with the F bit
> in the EAV/SAV codes". EAV/SAV codes are defined in [2].
> According to [2]:

Could you detail where this reference is to help searching for it
please? (it looks like Table 2, page 5)

> F=0 for field 1
> F=1 for field 2

It would help to indent those lines to make the whole text a bit more
readable...

> The bit FRAMENUMBER_INTERLACED is not initialized anywhere in the current
> version of the adv748x driver and therefore it is always 0, which is the
> default value according to [1]. Therefore the current association of field
> number from EAV/SAV code with the frame number in CSI FS and FE packets is:
> field 1 (top field for PAL, bottom field for NTSC) -> CSI frame number 2
> field 2 (bottom field for PAL, top field for NTSC) -> CSI frame number 1
> But this breaks frame number based field detection of top/bottom fields
> in CSI receivers. Therefore it makes sense to initialize the
> FRAMENUMBER_INTERLACED bit to 1 so the association is as expected:
> field 1 -> frame number 1
> field 2 -> frame number 2

I'm a bit worried by this patch, as it implies that we would have had
our fields inverted in our testing, or if they are not - then applying
this patch will then invert them! So either way we need to check this
carefully.

I can see the EAV:F values match the description above in the document...

Niklas, how does RCar-CSI determine the top/bottom sequence?

Do we have field inversion currently? (or one which is perhaps swapped
somewhere along the pipeline in rcar-vin?)


> [1] https://www.analog.com/en/products/adv7481.html
> [2] https://www.itu.int/rec/R-REC-BT.656-5-200712-I/en
> 
> Suggested-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index f57cd77..4dd1a13 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -278,6 +278,9 @@ static int adv748x_power_up_tx(struct adv748x_csi2 *tx)
>  	usleep_range(1000, 1500);
>  	adv748x_write_check(state, page, 0x31, 0x80, &ret);
>  
> +	/* set bit 7 (FRAMENUMBER_INTERLACED) in csi_tx_top_reg_1f */
> +	adv748x_write_check(state, page, 0x1f, 0x80, &ret);

I think it would be nice to store the bit as macro defines in
drivers/media/i2c/adv748x/adv748x.h

I appreciate that the rest of this function does not (yet) do that
however, (it has been derived from a table of ADI required writes) - but
I think now that it is split from a table to a function it could be nice
to clean up the 'magic numbers' along the way.

Of course if you have time to convert the rest of the function as well
(in a separate patch) that might be a nice cleanup, but not required.

> +
>  	return ret;
>  }
>  
> 

-- 
Regards
--
Kieran
