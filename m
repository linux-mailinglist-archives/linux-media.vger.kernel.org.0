Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA2AA708639
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 18:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbjERQuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 12:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjERQuR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 12:50:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D57AE69
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 09:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684428570;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ErMabRDduELolLVz51Rzbw7t9VD/UXkGPcjr4o8l4Wc=;
        b=PTTw7cVYIP/JjD3O5R905n4AwVBuZWxeHJMUnTg0qVF8DRGTvzPbUIrDb02qv3v4YYleGJ
        NS0DtuKnu7VfVgGcvgfOdRrCEfLvVClFzLxnXqoNc2ovS2lJYIR9n0KRpMSC6b/vUKmMPY
        MlWWA3H2/+1lWZmmj8gxfUinCZv9H5s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-lb-th9plOh-G8fmtFHdzCw-1; Thu, 18 May 2023 12:49:28 -0400
X-MC-Unique: lb-th9plOh-G8fmtFHdzCw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-50bc456a94dso2323865a12.1
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 09:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684428567; x=1687020567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ErMabRDduELolLVz51Rzbw7t9VD/UXkGPcjr4o8l4Wc=;
        b=Ftnl9RfL7ZxTM0yZGckRFSSOWUWwInnIlcUCC6xDZXwX1epdIBASS3bPMfiZFQuF7H
         ICxS2GnQE5NGHUuNWspN1x95pfAIbRP9YbqRzNSCyLDzS9OWwRTLcqZBHC4D/dUhLrFp
         OHvc3DsaribdK2CAO7K1wm8etxnvVszkoOQZjXCAinOkW7JcdftuugkzXCuXORUJa0Yr
         T2eYk/MSpI9XYxq+AH3f7WwxJ/v1NzTp7DQo3YvZOTdGPuMiJwsBwgnelIKsewdBTmI9
         3qs2mgZTPezNFt8762zwDGzpilRgez5+oF+0/uTv7Cl7RdnyPFP5YucFCg9m0y72+n7v
         XygQ==
X-Gm-Message-State: AC+VfDxNhFYUt3OPll00vntizDAKRnJ3ZPPyanJYHmu0DzxZbZieY6q8
        trQv+6zbyk166YEpyFwSfQO1QFjcTw2gTwlJEbkhgXQNLtUutfum+zD/ClXltJfTMaMAmuxRoe5
        e71IKPXyp7+QLJul+OgBRzYM=
X-Received: by 2002:a05:6402:32e:b0:510:86cc:f687 with SMTP id q14-20020a056402032e00b0051086ccf687mr5940489edw.20.1684428567551;
        Thu, 18 May 2023 09:49:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4bIYW6JN4v4XvK/YVwMc84h7OWQcCGtODeDwfD3mhRxa1Z6BqYYP8TYUy++Dn56/uSdcbzsQ==
X-Received: by 2002:a05:6402:32e:b0:510:86cc:f687 with SMTP id q14-20020a056402032e00b0051086ccf687mr5940467edw.20.1684428567243;
        Thu, 18 May 2023 09:49:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l25-20020aa7c319000000b0050bd9d3ddf3sm776972edq.42.2023.05.18.09.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 09:49:26 -0700 (PDT)
Message-ID: <4a53c677-a0c2-1829-9bd7-5da5e04414e8@redhat.com>
Date:   Thu, 18 May 2023 18:49:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper
 + gc0310 sensor driver
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230518153214.194976-1-hdegoede@redhat.com>
 <CAHp75Vd=0oXwKqwDghX8suK0qcYp8Ny31CRDkYFKa9M6QUax5Q@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd=0oXwKqwDghX8suK0qcYp8Ny31CRDkYFKa9M6QUax5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/18/23 18:02, Andy Shevchenko wrote:
> On Thu, May 18, 2023 at 6:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi All,
>>
>> Now that the atomisp driver supports v4l2-async sensor driver registration
>> (I'll post this as a separate series), there is no longer a need to have
>> atomisp specific sensor drivers and after cleanup atomisp sensor drivers
>> can now be moved to drivers/media/i2c as regular v4l2 sensor drivers!
> 
> Cool!
> 
> But since the patch 9/9 in that series is WIP (as far as I can see), I
> think we first need to concentrate to review that one. OTOH I'm not
> sure I got this right that I'm thinking that this series depends on
> that one one way or the other.


Only patches 3/9 and 9/9 depend on the other series in the sense that
they would break gc0310 support in atomisp without the other series.

3/9 can be moved to the end so the other 7 patches can be merged.

Most important in this series and the reason for posting it
separately is getting Sakari to ack patch 1/9 .

Sakari, I know you don't want platform dependent code in the sensor
drivers and I understand why. But in this case it is really
unavoidable.

To make this as painless as possible the helper function has
been made so that all sensors which may be used on affected
platforms only need this one extra line:

	v4l2_acpi_parse_sensor_gpios(&client->dev);

And on none ACPI platforms or when client was not instantiated
through ACPI this will be a stub / no-op.

So I hope that you are ok with this as a solution for
how the ACPI tables on these devices work ?

Regards,

Hans



