Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D835CCF0B7
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 04:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729457AbfJHCBF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 22:01:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37816 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729212AbfJHCBE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 22:01:04 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id C4C78283C65
Subject: Re: [PATCH] media: vimc: Make capture devices and subdevices use
 different link_validates
From:   Helen Koike <helen.koike@collabora.com>
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@protonmail.com>, linux-media@vger.kernel.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
References: <20191006191416.1130515-1-nfraprado@protonmail.com>
 <c05cf7ac-a139-77ea-afbd-e210116d5d8b@collabora.com>
Openpgp: preference=signencrypt
Autocrypt: addr=helen.koike@collabora.com; keydata=
 mQINBFmOMD4BEADb2nC8Oeyvklh+ataw2u/3mrl+hIHL4WSWtii4VxCapl9+zILuxFDrxw1p
 XgF3cfx7g9taWBrmLE9VEPwJA6MxaVnQuDL3GXxTxO/gqnOFgT3jT+skAt6qMvoWnhgurMGH
 wRaA3dO4cFrDlLsZIdDywTYcy7V2bou81ItR5Ed6c5UVX7uTTzeiD/tUi8oIf0XN4takyFuV
 Rf09nOhi24bn9fFN5xWHJooFaFf/k2Y+5UTkofANUp8nn4jhBUrIr6glOtmE0VT4pZMMLT63
 hyRB+/s7b1zkOofUGW5LxUg+wqJXZcOAvjocqSq3VVHcgyxdm+Nv0g9Hdqo8bQHC2KBK86VK
 vB+R7tfv7NxVhG1sTW3CQ4gZb0ZugIWS32Mnr+V+0pxci7QpV3jrtVp5W2GA5HlXkOyC6C7H
 Ao7YhogtvFehnlUdG8NrkC3HhCTF8+nb08yGMVI4mMZ9v/KoIXKC6vT0Ykz434ed9Oc9pDow
 VUqaKi3ey96QczfE4NI029bmtCY4b5fucaB/aVqWYRH98Jh8oIQVwbt+pY7cL5PxS7dQ/Zuz
 6yheqDsUGLev1O3E4R8RZ8jPcfCermL0txvoXXIA56t4ZjuHVcWEe2ERhLHFGq5Zw7KC6u12
 kJoiZ6WDBYo4Dp+Gd7a81/WsA33Po0j3tk/8BWoiJCrjXzhtRwARAQABtCdIZWxlbiBLb2lr
 ZSA8aGVsZW4ua29pa2VAY29sbGFib3JhLmNvbT6JAlQEEwEKAD4CGwEFCwkIBwMFFQoJCAsF
 FgIDAQACHgECF4AWIQSofQA6zrItXEgHWTzAfqwo9yFiXQUCXEz3bwUJBKaPRQAKCRDAfqwo
 9yFiXdUCD/4+WZr503hQ13KB4DijOW76ju8JDPp4p++qoPxtoAsld3yROoTI+VPWmt7ojHrr
 TZc7sTLxOFzaUC8HjGTb3r9ilIhIKf/M9KRLkpIJ+iLA+VoUbcSOMYWoVNfgLmbnqoezjPcy
 OHJwVw9dzEeYpvG6nkY6E4UktANySp27AniSXNuHOvYsOsXmUOqU1ScdsrQ9s732p/OGdTyw
 1yd3gUMLZvCKFOBVHILH59HCRJgpwUPiws8G4dGMs4GTRvHT2s2mDQdQ0HEvcM9rvCRVixuC
 5ZeOymZNi6lDIUIysgiZ+yzk6i5l/Ni6r7v20N3JppZvhPK6LqtaYceyAGyc3jjnOqoHT/qR
 kPjCwzmKiPtXjLw6HbRXtGgGtP5m3y8v6bfHH+66zd2vGCY0Z9EsqcnK4DCqRkLncFLPM2gn
 9cZcCmO4ZqXUhTyn1nHM494kd5NX1Op4HO+t9ErnpufkVjoMUeBwESdQwwwHT3rjUueGmCrn
 VJK69/qhA4La72VTxHutl+3Z0Xy20HWsZS8Gsam39f95/LtPLzbBwnOOi5ZoXnm97tF8HrAZ
 2h+kcRLMWw3BXy5q4gic+oFZMZP9oq1G9XTFld4FGgJ9ys8aGmhLM+uB1pFxb3XFtWQ2z4AJ
 iEp2VLl34quwfD6Gg4csiZe2KzvQHUe0w8SJ9LplrHPPprkCDQRZjjChARAAzISLQaHzaDOv
 ZxcoCNBk/hUGo2/gsmBW4KSj73pkStZ+pm3Yv2CRtOD4jBlycXjzhwBV7/70ZMH70/Y25dJa
 CnJKl/Y76dPPn2LDWrG/4EkqUzoJkhRIYFUTpkPdaVYznqLgsho19j7HpEbAum8r3jemYBE1
 AIuVGg4bqY3UkvuHWLVRMuaHZNy55aYwnUvd46E64JH7O990mr6t/nu2a1aJ0BDdi8HZ0RMo
 Eg76Avah+YR9fZrhDFmBQSL+mcCVWEbdiOzHmGYFoToqzM52wsNEpo2aStH9KLk8zrCXGx68
 ohJyQoALX4sS03RIWh1jFjnlw2FCbEdj/HDX0+U0i9COtanm54arYXiBTnAnx0F7LW7pv7sb
 6tKMxsMLmprP/nWyV5AfFRi3jxs5tdwtDDk/ny8WH6KWeLR/zWDwpYgnXLBCdg8l97xUoPQO
 0VkKSa4JEXUZWZx9q6kICzFGsuqApqf9gIFJZwUmirsxH80Fe04Tv+IqIAW7/djYpOqGjSyk
 oaEVNacwLLgZr+/j69/1ZwlbS8K+ChCtyBV4kEPzltSRZ4eU19v6sDND1JSTK9KSDtCcCcAt
 VGFlr4aE00AD/aOkHSylc93nPinBFO4AGhcs4WypZ3GGV6vGWCpJy9svfWsUDhSwI7GS/i/v
 UQ1+bswyYEY1Q3DjJqT7fXcAEQEAAYkEcgQYAQoAJgIbAhYhBKh9ADrOsi1cSAdZPMB+rCj3
 IWJdBQJcTPfVBQkEpo7hAkDBdCAEGQEKAB0WIQSomGMEg78Cd/pMshveCRfNeJ05lgUCWY4w
 oQAKCRDeCRfNeJ05lp0gD/49i95kPKjpgjUbYeidjaWuINXMCA171KyaBAp+Jp2Qrun4sIJB
 Z6srMj6O/gC34AhZln2sXeQdxe88sNbg6HjlN+4AkhTd6DttjOfUwnamLDA7uw+YIapGgsgN
 lznjLnqOaQ9mtEwRbZMUOdyRf9osSuL14vHl4ia3bYNJ52WYre6gLMu4K+Ghd02og+ILgIio
 Q827h0spqIJYHrR3Ynnhxdlv5GPCobh+AKsQMdTIuCzR6JSCBk6GHkg33SiWScKMUzT8B/cn
 ypLfGnfV/LDZ9wS2TMzIlK/uv0Vd4C0OGDd/GCi5Gwu/Ot0aY7fzZo2CiRV+/nJBWPRRBTji
 bE4FG2rt7WSRLO/QmH2meIW4f0USDiHeNwznHkPei59vRdlMyQdsxrmgSRDuX9Y3UkERxbgd
 uscqC8Cpcy5kpF11EW91J8aGpcxASc+5Pa66/+7CrpBC2DnfcfACdMAje7yeMn9XlHrqXNlQ
 GaglEcnGN2qVqRcKgcjJX+ur8l56BVpBPFYQYkYkIdQAuhlPylxOvsMcqI6VoEWNt0iFF3dA
 //0MNb8fEqw5TlxDPOt6BDhDKowkxOGIA9LOcF4PkaR9Qkvwo2P4vA/8fhCnMqlSPom4xYdk
 Ev8P554zDoL/XMHl+s7A0MjIJzT253ejZKlWeO68pAbNy/z7QRn2lFDnjwkQwH6sKPchYl2f
 0g//Yu3vDkqk8+mi2letP3XBl2hjv2eCZjTh34VvtgY5oeL2ROSJWNd18+7O6q3hECZ727EW
 gIb3LK9g4mKF6+Rch6Gwz1Y4fmC5554fd2Y2XbVzzz6AGUC6Y+ohNg7lTAVO4wu43+IyTB8u
 ip5rX/JDGFv7Y1sl6tQJKAVIKAJE+Z3Ncqh3doQr9wWHl0UiQYKbSR9HpH1lmC1C3EEbTpwK
 fUIpZd1eQNyNJl1jHsZZIBYFsAfVNH/u6lB1TU+9bSOsV5SepdIb88d0fm3oZ4KzjhRHLFQF
 RwNUNn3ha6x4fbxYcwbvu5ZCiiX6yRTPoage/LUNkgQNX2PtPcur6CdxK6Pqm8EAI7PmYLfN
 NY3y01XhKNRvaVZoH2FugfUkhsBITglTIpI+n6YU06nDAcbeINFo67TSE0iL6Pek5a6gUQQC
 6w+hJCaMr8KYud0q3ccHyU3TlAPDe10En3GsVz7Y5Sa3ODGdbmkfjK8Af3ogGNBVmpV16Xl8
 4rETFv7POSUB2eMtbpmBopd+wKqHCwUEy3fx1zDbM9mp+pcDoL73rRZmlgmNfW/4o4qBzxRf
 FYTQLE69wAFU2IFce9PjtUAlBdC+6r3X24h3uD+EC37s/vWhxuKj2glaU9ONrVJ/SPvlqXOO
 WR1Zqw57vHMKimLdG3c24l8PkSw1usudgAA5OyO5Ag0EWY4wyQEQAMVp0U38Le7d80Mu6AT+
 1dMes87iKn30TdMuLvSg2uYqJ1T2riRBF7zU6u74HF6zps0rPQviBXOgoSuKa1hnS6OwFb9x
 yQPlk76LY96SUB5jPWJ3fO78ZGSwkVbJFuG9gpD/41n8Unn1hXgDb2gUaxD0oXv/723EmTYC
 vSo3z6Y8A2aBQNr+PyhQAPDazvVQ+P7vnZYq1oK0w+D7aIix/Bp4mo4VbgAeAeMxXWSZs8N5
 NQtXeTBgB7DqrfJP5wWwgCsROfeds6EoddcYgqhG0zVU9E54C8JcPOA0wKVs+9+gt2eyRNtx
 0UhFbah7qXuJGhWy/0CLXvVoCoS+7qpWz070TBAlPZrg9D0o2gOw01trQgoKAYBKKgJhxaX/
 4gzi+5Ccm33LYH9lAVTdzdorejuV1xWdsnNyc8OAPeoXBf9RIIWfQVmbhVXBp2DAPjV6/kIJ
 Eml7MNJfEvqjV9zKsWF9AFlsqDWZDCyUdqR96ahTSD34pRwb6a9H99/GrjeowKaaL95DIVZT
 C6STvDNL6kpys4sOe2AMmQGv2MMcJB3aYLzH8f1sEQ9S0UMX7/6CifEG6JodG6Y/W/lLo1Vv
 DxeDA+u4Lgq6qxlksp8M78FjcmxFVlf4cpCi2ucbZxurhlBkjtZZ8MVAEde3hlqjcBl2Ah6Q
 D826FTxscOGlHEfNABEBAAGJAjwEGAEKACYCGwwWIQSofQA6zrItXEgHWTzAfqwo9yFiXQUC
 XEz31QUJBKaOuQAKCRDAfqwo9yFiXUvnEACBWe8wSnIvSX+9k4LxuLq6GQTOt+RNfliZQkCW
 5lT3KL1IJyzzOm4x+/slHRBl8bF7KEZyOPinXQXyJ/vgIdgSYxDqoZ7YZn3SvuNe4aT6kGwL
 EYYEV8Ecj4ets15FR2jSUNnVv5YHWtZ7bP/oUzr2LT54fjRcstYxgwzoj8AREtHQ4EJWAWCO
 ZuEHTSm5clMFoi41CmG4DlJbzbo4YfilKYm69vwh50Y8WebcRN31jh0g8ufjOJnBldYYBLwN
 Obymhlfy/HKBDIbyCGBuwYoAkoJ6LR/cqzl/FuhwhuDocCGlXyYaJOwXgHaCvVXI3PLQPxWZ
 +vPsD+TSVHc9m/YWrOiYDnZn6aO0Uk1Zv/m9+BBkWAwsreLJ/evn3SsJV1omNBTITG+uxXcf
 JkgmmesIAw8mpI6EeLmReUJLasz8QkzhZIC7t5rGlQI94GQG3Jg2dC+kpaGWOaT5G4FVMcBj
 iR1nXfMxENVYnM5ag7mBZyD/kru5W1Uj34L6AFaDMXFPwedSCpzzqUiHb0f+nYkfOodf5xy0
 46+3THy/NUS/ZZp/rI4F7Y77+MQPVg7vARfHHX1AxYUKfRVW5j88QUB70txn8Vgi1tDrOr4J
 eD+xr0CvIGa5lKqgQacQtGkpOpJ8zY4ObSvpNubey/qYUE3DCXD0n2Xxk4muTvqlkFpOYA==
Message-ID: <7393e34e-2de6-13c4-4f8a-a19bfec841bd@collabora.com>
Date:   Mon, 7 Oct 2019 23:00:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <c05cf7ac-a139-77ea-afbd-e210116d5d8b@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/6/19 9:42 PM, Helen Koike wrote:
> Hi Nícolas,
> 
> Thanks for you patch, just some small comments below.
> 
> On 10/6/19 4:14 PM, Nícolas F. R. A. Prado wrote:
>> Instead of validating the links to capture devices and subdevices with
>> the same function, use the default v4l function for links between
>> subdevices and only use a different function for validating between
>> capture device and subdevice.
>> This change should also ease future work to associate multiple mbus
>> codes for the same pixelformat in vimc_pix_map.
>>
>> These changes were tested with 
>> v4l2-compliance SHA: 3f806630e2ecbcebe31872b865c5c4b42f111a99, 64 bits
>> and passed all tests:
>> Grand Total for vimc device /dev/media0: 451, Succeeded: 451, Failed: 0, Warnings: 0
>>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@protonmail.com>
>> ---
>>  drivers/media/platform/vimc/vimc-capture.c |  78 +++++++++++++++-
>>  drivers/media/platform/vimc/vimc-common.c  | 103 ++++-----------------
>>  drivers/media/platform/vimc/vimc-common.h  |   3 +
>>  3 files changed, 96 insertions(+), 88 deletions(-)
>>
>> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
>> index 602f80323031..924b99f82123 100644
>> --- a/drivers/media/platform/vimc/vimc-capture.c
>> +++ b/drivers/media/platform/vimc/vimc-capture.c
>> @@ -321,8 +321,84 @@ static const struct vb2_ops vimc_cap_qops = {
>>  	.wait_finish		= vb2_ops_wait_finish,
>>  };
>>  
>> +int vimc_cap_link_validate(struct media_link *link)
> 
> This function is only used inside the capture, it could be static.

Actually, I was thinking that it is maybe better to leave this function in
vimc-common and rename it to vimc_vdev_link_validate(), as it is generic
to any video_device, and we also avoid to moving it to from vimc-common to
vimc-cap and back to vimc-common again if we add other video devices.

Regards,
Helen

> 
> Unless if you want to make it a generic function in vimc-common.h, so the future
> output device could use it as well, but it can be done in the output patch.
> 
> 
>> +{
>> +	struct v4l2_pix_format source_fmt, sink_fmt;
>> +	int ret;
>> +
>> +	ret = vimc_get_pix_format(link->source, &source_fmt);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = vimc_get_pix_format(link->sink, &sink_fmt);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pr_info("vimc link validate: "
>> +		"%s:src:%dx%d (0x%x, %d, %d, %d, %d) "
>> +		"%s:snk:%dx%d (0x%x, %d, %d, %d, %d)\n",
>> +		/* src */
>> +		link->source->entity->name,
>> +		source_fmt.width, source_fmt.height,
>> +		source_fmt.pixelformat, source_fmt.colorspace,
>> +		source_fmt.quantization, source_fmt.xfer_func,
>> +		source_fmt.ycbcr_enc,
>> +		/* sink */
>> +		link->sink->entity->name,
>> +		sink_fmt.width, sink_fmt.height,
>> +		sink_fmt.pixelformat, sink_fmt.colorspace,
>> +		sink_fmt.quantization, sink_fmt.xfer_func,
>> +		sink_fmt.ycbcr_enc);
>> +
>> +	/* The width, height and pixelformat must match. */
>> +	if (source_fmt.width != sink_fmt.width
>> +	    || source_fmt.height != sink_fmt.height
>> +	    || source_fmt.pixelformat != sink_fmt.pixelformat)
>> +		return -EPIPE;
>> +
>> +	/*
>> +	 * The field order must match, or the sink field order must be NONE
>> +	 * to support interlaced hardware connected to bridges that support
>> +	 * progressive formats only.
>> +	 */
>> +	if (source_fmt.field != sink_fmt.field &&
>> +	    sink_fmt.field != V4L2_FIELD_NONE)
>> +		return -EPIPE;
>> +
>> +	/*
>> +	 * If colorspace is DEFAULT, then assume all the colorimetry is also
>> +	 * DEFAULT, return 0 to skip comparing the other colorimetry parameters
>> +	 */
>> +	if (source_fmt.colorspace == V4L2_COLORSPACE_DEFAULT
>> +	    || sink_fmt.colorspace == V4L2_COLORSPACE_DEFAULT)
>> +		return 0;
>> +
>> +	/* Colorspace must match. */
>> +	if (source_fmt.colorspace != sink_fmt.colorspace)
>> +		return -EPIPE;
>> +
>> +	/* Colorimetry must match if they are not set to DEFAULT */
>> +	if (source_fmt.ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT
>> +	    && sink_fmt.ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT
>> +	    && source_fmt.ycbcr_enc != sink_fmt.ycbcr_enc)
>> +		return -EPIPE;
>> +
>> +	if (source_fmt.quantization != V4L2_QUANTIZATION_DEFAULT
>> +	    && sink_fmt.quantization != V4L2_QUANTIZATION_DEFAULT
>> +	    && source_fmt.quantization != sink_fmt.quantization)
>> +		return -EPIPE;
>> +
>> +	if (source_fmt.xfer_func != V4L2_XFER_FUNC_DEFAULT
>> +	    && sink_fmt.xfer_func != V4L2_XFER_FUNC_DEFAULT
>> +	    && source_fmt.xfer_func != sink_fmt.xfer_func)
>> +		return -EPIPE;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(vimc_cap_link_validate);
> 
> No need to export it here.
> 
>> +
>>  static const struct media_entity_operations vimc_cap_mops = {
>> -	.link_validate		= vimc_link_validate,
>> +	.link_validate		= vimc_cap_link_validate,
>>  };
>>  
>>  static void vimc_cap_release(struct video_device *vdev)
>> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
>> index a3120f4f7a90..fe91d67811e5 100644
>> --- a/drivers/media/platform/vimc/vimc-common.c
>> +++ b/drivers/media/platform/vimc/vimc-common.c
>> @@ -247,35 +247,40 @@ int vimc_pipeline_s_stream(struct media_entity *ent, int enable)
>>  }
>>  EXPORT_SYMBOL_GPL(vimc_pipeline_s_stream);
>>  
>> -static int vimc_get_mbus_format(struct media_pad *pad,
>> -				struct v4l2_subdev_format *fmt)
>> +int vimc_get_pix_format(struct media_pad *pad,
>> +				struct v4l2_pix_format *fmt)
> 
> Could you align the arguments please?
> 
>>  {
>>  	if (is_media_entity_v4l2_subdev(pad->entity)) {
>>  		struct v4l2_subdev *sd =
>>  			media_entity_to_v4l2_subdev(pad->entity);
>> +		struct v4l2_subdev_format sd_fmt;
>> +		const struct vimc_pix_map *pix_map;
>>  		int ret;
>>  
>> -		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>> -		fmt->pad = pad->index;
>> +		sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>> +		sd_fmt.pad = pad->index;
>> +
>> +		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
>>  
> 
> Please remove this blank line, so that the error check follows the function.
> 
>> -		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, fmt);
>>  		if (ret)
>>  			return ret;
>>  
>> +		v4l2_fill_pix_format(fmt, &sd_fmt.format);
>> +
> 
> No need for this blank line.
> 
>> +		pix_map = vimc_pix_map_by_code(sd_fmt.format.code);
>> +		fmt->pixelformat = pix_map->pixelformat;
>> +
> 
> Could you also remove this blank like?
> 
>>  	} else if (is_media_entity_v4l2_video_device(pad->entity)) {
>>  		struct video_device *vdev = container_of(pad->entity,
>>  							 struct video_device,
>>  							 entity);
>>  		struct vimc_ent_device *ved = video_get_drvdata(vdev);
>> -		const struct vimc_pix_map *vpix;
>> -		struct v4l2_pix_format vdev_fmt;
>>  
>>  		if (!ved->vdev_get_format)
>>  			return -ENOIOCTLCMD;
>>  
>> -		ved->vdev_get_format(ved, &vdev_fmt);
>> -		vpix = vimc_pix_map_by_pixelformat(vdev_fmt.pixelformat);
>> -		v4l2_fill_mbus_format(&fmt->format, &vdev_fmt, vpix->code);
>> +		ved->vdev_get_format(ved, fmt);
>> +
> 
> And this one too.
> 
>>  	} else {
>>  		return -EINVAL;
>>  	}
>> @@ -283,84 +288,8 @@ static int vimc_get_mbus_format(struct media_pad *pad,
>>  	return 0;
>>  }
>>  
>> -int vimc_link_validate(struct media_link *link)
>> -{
>> -	struct v4l2_subdev_format source_fmt, sink_fmt;
>> -	int ret;
>> -
>> -	ret = vimc_get_mbus_format(link->source, &source_fmt);
>> -	if (ret)
>> -		return ret;
>> -
>> -	ret = vimc_get_mbus_format(link->sink, &sink_fmt);
>> -	if (ret)
>> -		return ret;
>> -
>> -	pr_info("vimc link validate: "
>> -		"%s:src:%dx%d (0x%x, %d, %d, %d, %d) "
>> -		"%s:snk:%dx%d (0x%x, %d, %d, %d, %d)\n",
>> -		/* src */
>> -		link->source->entity->name,
>> -		source_fmt.format.width, source_fmt.format.height,
>> -		source_fmt.format.code, source_fmt.format.colorspace,
>> -		source_fmt.format.quantization, source_fmt.format.xfer_func,
>> -		source_fmt.format.ycbcr_enc,
>> -		/* sink */
>> -		link->sink->entity->name,
>> -		sink_fmt.format.width, sink_fmt.format.height,
>> -		sink_fmt.format.code, sink_fmt.format.colorspace,
>> -		sink_fmt.format.quantization, sink_fmt.format.xfer_func,
>> -		sink_fmt.format.ycbcr_enc);
>> -
>> -	/* The width, height and code must match. */
>> -	if (source_fmt.format.width != sink_fmt.format.width
>> -	    || source_fmt.format.height != sink_fmt.format.height
>> -	    || source_fmt.format.code != sink_fmt.format.code)
>> -		return -EPIPE;
>> -
>> -	/*
>> -	 * The field order must match, or the sink field order must be NONE
>> -	 * to support interlaced hardware connected to bridges that support
>> -	 * progressive formats only.
>> -	 */
>> -	if (source_fmt.format.field != sink_fmt.format.field &&
>> -	    sink_fmt.format.field != V4L2_FIELD_NONE)
>> -		return -EPIPE;
>> -
>> -	/*
>> -	 * If colorspace is DEFAULT, then assume all the colorimetry is also
>> -	 * DEFAULT, return 0 to skip comparing the other colorimetry parameters
>> -	 */
>> -	if (source_fmt.format.colorspace == V4L2_COLORSPACE_DEFAULT
>> -	    || sink_fmt.format.colorspace == V4L2_COLORSPACE_DEFAULT)
>> -		return 0;
>> -
>> -	/* Colorspace must match. */
>> -	if (source_fmt.format.colorspace != sink_fmt.format.colorspace)
>> -		return -EPIPE;
>> -
>> -	/* Colorimetry must match if they are not set to DEFAULT */
>> -	if (source_fmt.format.ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT
>> -	    && sink_fmt.format.ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT
>> -	    && source_fmt.format.ycbcr_enc != sink_fmt.format.ycbcr_enc)
>> -		return -EPIPE;
>> -
>> -	if (source_fmt.format.quantization != V4L2_QUANTIZATION_DEFAULT
>> -	    && sink_fmt.format.quantization != V4L2_QUANTIZATION_DEFAULT
>> -	    && source_fmt.format.quantization != sink_fmt.format.quantization)
>> -		return -EPIPE;
>> -
>> -	if (source_fmt.format.xfer_func != V4L2_XFER_FUNC_DEFAULT
>> -	    && sink_fmt.format.xfer_func != V4L2_XFER_FUNC_DEFAULT
>> -	    && source_fmt.format.xfer_func != sink_fmt.format.xfer_func)
>> -		return -EPIPE;
>> -
>> -	return 0;
>> -}
>> -EXPORT_SYMBOL_GPL(vimc_link_validate);
>> -
>>  static const struct media_entity_operations vimc_ent_sd_mops = {
>> -	.link_validate = vimc_link_validate,
>> +	.link_validate = v4l2_subdev_link_validate,
>>  };
>>  
>>  int vimc_ent_sd_register(struct vimc_ent_device *ved,
>> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
>> index 698db7c07645..8a4310430292 100644
>> --- a/drivers/media/platform/vimc/vimc-common.h
>> +++ b/drivers/media/platform/vimc/vimc-common.h
>> @@ -263,6 +263,9 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
>>  void vimc_ent_sd_unregister(struct vimc_ent_device *ved,
>>  			    struct v4l2_subdev *sd);
>>  
>> +
>> +int vimc_get_pix_format(struct media_pad *pad, struct v4l2_pix_format *fmt);
>> +
> 
> You don't need this if you make the function static.
> 
>>  /**
>>   * vimc_link_validate - validates a media link
>>   *
>>
> 
> 
> Thanks!
> Helen
> 
