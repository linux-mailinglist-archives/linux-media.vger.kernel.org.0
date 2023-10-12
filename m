Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4395C7C6DA8
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 14:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347224AbjJLMLT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 08:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343869AbjJLMLQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 08:11:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB016BE
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 05:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697112628;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=27M+MIAmpe+L/2HgaOkMQYAzM+WcqJam0R6eMp8zZVc=;
        b=S+RYy++7ud+vgx2unqlm7R42Q7KBzemLaEhsaGfhgpytGga3RgFv0K/JzS4IqB+7KED75o
        JLl0kWhQIvFe05ExqyEP4dhfNWF3cIr44z9ruGdEW6/EuB2WjViZoxKqcdyB+7XsGEYuzp
        CqovSflX/ceh3HvuSd5qHXEmzm+PP9w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-CnlfOu0hOd2L2HXpv11nVQ-1; Thu, 12 Oct 2023 08:10:16 -0400
X-MC-Unique: CnlfOu0hOd2L2HXpv11nVQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99c8bbc902eso69021866b.1
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 05:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697112615; x=1697717415;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27M+MIAmpe+L/2HgaOkMQYAzM+WcqJam0R6eMp8zZVc=;
        b=bJSWBEu8/rzOJ1LUKyO41gNblrLUYdzeh29EQm2ZH4sI29niLTuryENyXtEVUet90z
         llmQh9DfOrxTCIkfJc61byCVSPFmXzYVbsHK9rvB0gmtTrbA2IRrUpUaCdx9YoFYqU3v
         JSAB2T0AxLiuBGkSFwbAtExb8EFMMea8o8RSXzlxyt3n639fT6jEoVc9qHBvtIbxHyGH
         0FQq1PpVW/GkLrWBwNwfuutz7O+51SvrJ1/ErI9V5vtVPb1pzG0gJkg/SDPa7qd/nBdP
         zumJI2NKTNqvo65+UFUzezWapq0XjSHAtMSHpGsvKy5ZMF6JPyZ+lDhjpfVsy2TwU6XN
         AH4g==
X-Gm-Message-State: AOJu0YwGS6kQykWWL61JsnSDphMbIfBLDht+CKtPt+xsf2EcbRaBkxgs
        +OgJ+j3OaOIN9eYyb8D+s5J72/nzkDX8kDwb0/Oa82c/8O35QUknAHm36zTZ7TlCd4P5Kj18Zb9
        LLfrmAZBtE9rc2LfU6e8YIIY=
X-Received: by 2002:a17:906:1092:b0:9bd:8cfd:e588 with SMTP id u18-20020a170906109200b009bd8cfde588mr1625678eju.27.1697112615680;
        Thu, 12 Oct 2023 05:10:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkVyuhaskOIIVNVit9o80c6O2JAINjoNgAy46RiSAkOYOLUZ42tscH4PSdUZo1OCucR3X4XQ==
X-Received: by 2002:a17:906:1092:b0:9bd:8cfd:e588 with SMTP id u18-20020a170906109200b009bd8cfde588mr1625662eju.27.1697112615307;
        Thu, 12 Oct 2023 05:10:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id la18-20020a170906ad9200b0099cd008c1a4sm11019663ejb.136.2023.10.12.05.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:10:14 -0700 (PDT)
Message-ID: <7ad450c4-78df-ed5c-a05d-5dca8201d081@redhat.com>
Date:   Thu, 12 Oct 2023 14:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v11 16/56] media: atomisp: Use vb2_get_buffer() instead of
 directly access to buffers array
Content-Language: en-US, nl
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
        ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com, Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
 <20231012114642.19040-17-benjamin.gaignard@collabora.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231012114642.19040-17-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/12/23 13:46, Benjamin Gaignard wrote:
> Use vb2_get_buffer() instead of directly access to vb2_buffer buffer array.
> This could allow to change the type bufs[] field of vb2_buffer structure if
> needed.
> No need to check the result of vb2_get_buffer, vb2_ioctl_dqbuf() already
> checked that it is valid.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Hans de Goede <hdegoede@redhat.com>
> CC: Mauro Carvalho Chehab <mchehab@kernel.org>
> CC: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index a8e4779d007f..a8a964b2f1a8 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -1059,7 +1059,7 @@ static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer
>  	if (ret)
>  		return ret;
>  
> -	vb = pipe->vb_queue.bufs[buf->index];
> +	vb = vb2_get_buffer(&pipe->vb_queue, buf->index);
>  	frame = vb_to_frame(vb);
>  
>  	buf->reserved = asd->frame_status[buf->index];

