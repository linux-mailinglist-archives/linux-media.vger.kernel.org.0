Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFDB57BD8B3
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 12:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345535AbjJIKeL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 06:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345853AbjJIKeK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 06:34:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B8F9C
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 03:34:07 -0700 (PDT)
Received: from [192.168.88.20] (91-157-153-81.elisa-laajakaista.fi [91.157.153.81])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0908C7E4;
        Mon,  9 Oct 2023 12:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696847643;
        bh=tl0oyi4I/x/tHSKj+OJH+8cxqh94QYO5uYoBRBiCg8o=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=njiFH+XvTBvozr67EGxHJnMxGJ2C4zTJWu15YxhZWVkSgO8HJAyda7O9q9hYwbZ9K
         BV8BaM9ofdv22PGdhzlPDmYtCf8pr1NdAk7rhbGY8FrGa7OUHXk44KR83UfHE0mBFp
         egWWINZVuRys93Pz6ixu7ettQn6Qd6B54Eud4X0I=
Message-ID: <c3640f19-ae69-4915-b0f2-acc480c6aa07@ideasonboard.com>
Date:   Mon, 9 Oct 2023 13:34:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/28] media: v4l: subdev: Add a function to lock two
 sub-device states, use it
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-4-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <20231003120813.77726-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/10/2023 15:07, Sakari Ailus wrote:
> Add two new functions, v4l2_subdev_lock_states() and
> v4l2_subdev_unclock_states(), to acquire and release the state of two
> sub-devices. They differ from calling v4l2_subdev_{un,}lock_state() so
> that if the two states share the same lock, the lock is acquired only
> once.
> 
> Also use the new functions in v4l2_subdev_link_validate().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/media/v4l2-core/v4l2-subdev.c | 12 +++-----
>   include/media/v4l2-subdev.h           | 40 +++++++++++++++++++++++++++
>   2 files changed, 44 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 854f9d4db923..df9a1ae65410 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1377,17 +1377,13 @@ int v4l2_subdev_link_validate(struct media_link *link)
>   
>   	states_locked = sink_state && source_state;
>   
> -	if (states_locked) {
> -		v4l2_subdev_lock_state(sink_state);
> -		v4l2_subdev_lock_state(source_state);
> -	}
> +	if (states_locked)
> +		v4l2_subdev_lock_states(sink_state, source_state);
>   
>   	ret = v4l2_subdev_link_validate_locked(link, states_locked);
>   
> -	if (states_locked) {
> -		v4l2_subdev_unlock_state(sink_state);
> -		v4l2_subdev_unlock_state(source_state);
> -	}
> +	if (states_locked)
> +		v4l2_subdev_unlock_states(sink_state, source_state);
>   
>   	return ret;
>   }
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 7c34243ffed9..e49e8af2fb52 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1418,6 +1418,46 @@ static inline void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
>   	mutex_unlock(state->lock);
>   }
>   
> +/**
> + * v4l2_subdev_lock_states - Lock two sub-device states
> + * @state1: One subdevice state
> + * @state2: The other subdevice state
> + *
> + * Locks the state of two sub-devices.
> + *
> + * The states must be unlocked with v4l2_subdev_unlock_states() after use.
> + *
> + * This differs from calling v4l2_subdev_lock_state() on both states so that if
> + * the states share the same lock, the lock is acquired only once (so no
> + * deadlock occurs). Note that it must be ensured the locks must always be
> + * acquired in the same order.

Either s/must/will/ or maybe "note that the locks must always be 
acquired...".

Maybe it should be stated that state1 and state2 have to be from 
subdevices that are connected via a media link and something like "the 
sink subdevice must always be state 1, and the source subdevice must 
always be state2".

  Tomi

> + */
> +static inline void v4l2_subdev_lock_states(struct v4l2_subdev_state *state1,
> +					   struct v4l2_subdev_state *state2)
> +{
> +	mutex_lock(state1->lock);
> +	if (state1->lock != state2->lock)
> +		mutex_lock(state2->lock);
> +}
> +
> +/**
> + * v4l2_subdev_unlock_states() - Unlock two sub-device states
> + * @state1: One subdevice state
> + * @state2: The other subdevice state
> + *
> + * Unlocks the state of two sub-devices.
> + *
> + * This differs from calling v4l2_subdev_unlock_state() on both states so that if
> + * the states share the same lock, the lock is released only once.
> + */
> +static inline void v4l2_subdev_unlock_states(struct v4l2_subdev_state *state1,
> +					     struct v4l2_subdev_state *state2)
> +{
> +	mutex_unlock(state1->lock);
> +	if (state1->lock != state2->lock)
> +		mutex_unlock(state2->lock);
> +}
> +
>   /**
>    * v4l2_subdev_get_unlocked_active_state() - Checks that the active subdev state
>    *					     is unlocked and returns it

