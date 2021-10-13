Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A87D242C4C2
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 17:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbhJMP1r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 11:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232692AbhJMP1q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 11:27:46 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F3CC061570;
        Wed, 13 Oct 2021 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=wLKFl9hJovma3HR1JQUfzFV4dSW0MXFKvmPEDZSEdrw=; b=ZH2RJkVXauMhi5VttRQ3IPzAlc
        G5OAV4VS/VFJbAP0AHqJcJaLBXIdN42F3co5T7Si3Lz84xyCh5m0F86d2/iJ4IKQlQUvqPretTmcB
        /WV6r6iEMjSkq6+Z9GaoOolYxiTaFivy+6Rd3KSnE/Gshi2e/Elh9QDJCTF0HotaHc1btqRgC05Yw
        4IyKUel7pECtsBgKGvjTzeaVFk8YMOzNJiSv2KzNaVBYZVdHOrbSZroTl7i9HjDWRKkQiulOwb//Z
        gcLDJl9mCOCoGnBy8KwaW40aqY13RhK0rKhN97hjy1pXQqjn0NDWjsRT0Rn6NwwjG94qj31NlDKKj
        F1zFWdVw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mag8M-00HLgm-Vm; Wed, 13 Oct 2021 15:25:35 +0000
Subject: Re: [PATCH v2 3/6] staging: media: wave5: Add the v4l2 layer
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Robert Beckett <bob.beckett@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        kiril.bicevski@collabora.com,
        Nas Chung <nas.chung@chipsnmedia.com>,
        lafley.kim@chipsnmedia.com, scott.woo@chipsnmedia.com,
        olivier.crete@collabora.com
References: <20211013105609.21457-1-dafna.hirschfeld@collabora.com>
 <20211013105609.21457-4-dafna.hirschfeld@collabora.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ad36b166-ed51-5192-c12e-d6c86d7ad083@infradead.org>
Date:   Wed, 13 Oct 2021 08:25:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211013105609.21457-4-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/13/21 3:56 AM, Dafna Hirschfeld wrote:
> diff --git a/drivers/staging/media/wave5/Kconfig b/drivers/staging/media/wave5/Kconfig
> new file mode 100644
> index 000000000000..efaacf391e01
> --- /dev/null
> +++ b/drivers/staging/media/wave5/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config VIDEO_WAVE_VPU
> +        tristate "Chips&Media Wave Codec Driver"
> +        depends on VIDEO_DEV && VIDEO_V4L2 && OF
> +        select VIDEOBUF2_DMA_CONTIG
> +        select VIDEOBUF2_VMALLOC
> +        select V4L2_MEM2MEM_DEV
> +        help
> +          Chips&Media stateful encoder and decoder driver.
> +	  The driver supports HEVC and H264 formats.
> +          To compile this driver as modules, choose M here: the
> +          modules will be called wave5.

Please follow coding-style for Kconfig files:

(from Documentation/process/coding-style.rst, section 10):

For all of the Kconfig* configuration files throughout the source tree,
the indentation is somewhat different.  Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.


Also, depending on OF is usually not necessary since there are stubs
for non-CONFIG_OF functions.  That may even allow you to add
COMPILE_TEST here.

thanks.
-- 
~Randy
