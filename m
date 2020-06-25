Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16AD420A540
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 20:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406075AbgFYSwk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 14:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405853AbgFYSwj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 14:52:39 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72343C08C5C1
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 11:52:39 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id z63so6417547qkb.8
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2020 11:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V1lQMCIImAGbpv+hQyfEaCIfz1+ucSK8SNoO6kl7LE0=;
        b=YTbc1gNJEmfXcJycQrj/zD7pygv/95Mc7WMZWpx/esQ+0Cww9Krkd/UWcvkANFv9hn
         sKvGFt6k3WmLxq5dedL2dz+76Yvv5r13mDV7hMW+gyHfPnvE5cAZeHDpYsqxXuZbFtjg
         eBsDvZeRqolgSM7PUmwI/n/TeZUnqQNfF5CFFyBpr3MqcUYgtly/8z7FsAQKM8Qc6H1F
         gMSPeJveK4eOpXcpOPwRaGwj/EsfRYf/CYLpZssaRpzFmFEaEBJvvX7vUV3KZG4bHdvc
         4/jGCu2/QHqVjfexfQwnkUBc3IvOQwhyJvBtCUYl6lyWv6js2qolLzGpCVPqMNDGgpZj
         1ogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V1lQMCIImAGbpv+hQyfEaCIfz1+ucSK8SNoO6kl7LE0=;
        b=nmwAjFUsF+CvWvxP1A3bbAjrgZZblRP8C6rblMHvAyyb65ixzbKD76MJveUvbX2U/9
         zkw0BxxHyRwvHwpAh8FcpkuXbiCk2SdgL7O2FrM/tPsobrjEUeDDNQzTnTBNJXMNviae
         SY75EVAJWD8YK0I781UEjNcD4fav0U8a6ZKt53YCcVjXlqQK2bfjCyadUjHLjOoSvjmm
         EjI53bsiuX6lopvnY6M9XRI/nv/qjhTXVCH6KdtpuG5tRvaOrOrg0vcO8OUHO7hR+WRx
         pb+zwYAsYGT1DGXmBaosYK1rx1M4Pr2um76o4ns7uDgIFqXK5N989WXmBCkOC0EWQYTL
         Jcug==
X-Gm-Message-State: AOAM530A9Q4coyDKbyqmwqofaxceM9JCMwLgHW4A5NC+PzrHXEZA5YK0
        FkTXMZ+hjfJ9kIhZpLCehJuDXw==
X-Google-Smtp-Source: ABdhPJwrYQMhQoIQ/sSMn0PgIQE3d1o5fP9SZGUd/R3gmD6CB9qxRvbfe0tSUPjcOXbsKTh74rvN4Q==
X-Received: by 2002:a37:85c2:: with SMTP id h185mr7022903qkd.131.1593111158437;
        Thu, 25 Jun 2020 11:52:38 -0700 (PDT)
Received: from [192.168.0.102] ([186.136.155.69])
        by smtp.gmail.com with ESMTPSA id n64sm6432285qke.77.2020.06.25.11.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 11:52:38 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] Add support for meson building
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
To:     Gregor Jasny <gjasny@googlemail.com>,
        Xavier Claessens <xavier.claessens@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        nicolas@ndufresne.ca,
        nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20200618133303.28676-1-ariel@vanguardiasur.com.ar>
 <20200618133303.28676-2-ariel@vanguardiasur.com.ar>
 <d09caaf6-402f-ba57-825c-410ce39a5e2b@ideasonboard.com>
 <f2bf8846e265024c20a77fa618d54455b3b7ca95.camel@collabora.com>
 <20200619144229.GD5823@pendragon.ideasonboard.com>
 <adbb92de81105575d661f348a9804279a2844d64.camel@collabora.com>
 <93bf1b72-0108-1dfa-22b4-f2194660129c@googlemail.com>
 <0d3450f0-8883-e094-3c1b-d8f93c2e4833@googlemail.com>
 <1586973f-5f69-fed0-4ad8-266cdd8e818b@vanguardiasur.com.ar>
Message-ID: <f4c5552e-c639-8e71-968e-1cd8fe5152cb@vanguardiasur.com.ar>
Date:   Thu, 25 Jun 2020 15:52:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1586973f-5f69-fed0-4ad8-266cdd8e818b@vanguardiasur.com.ar>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 6/23/20 2:26 PM, Ariel D'Alessandro wrote:
> Hi Gregor,
> 
> Thanks for the report.
> 
> On 6/22/20 4:09 PM, Gregor Jasny wrote:
>> Hello,
>>
>> On 6/22/20 8:07 PM, Gregor Jasny wrote:
[snip]
>> * doxygen targets are missing
>>   see
>> https://gitlab.com/adalessandro/v4l-utils/-/blob/ariel/mesonbuild-v4/m4/ax_prog_doxygen.m4
> 
> Will check.

The Doxygen m4 script provides several features, like:

    $ git grep 'DX_ARG_ABLE(' m4/ax_prog_doxygen.m4
      m4/ax_prog_doxygen.m4:DX_ARG_ABLE(doc, [generate any doxygen documentation],
      m4/ax_prog_doxygen.m4:DX_ARG_ABLE(dot, [generate graphics for doxygen
documentation],
      m4/ax_prog_doxygen.m4:DX_ARG_ABLE(man, [generate doxygen manual pages],
      m4/ax_prog_doxygen.m4:DX_ARG_ABLE(rtf, [generate doxygen RTF documentation],
      m4/ax_prog_doxygen.m4:DX_ARG_ABLE(xml, [generate doxygen XML documentation],
      m4/ax_prog_doxygen.m4:DX_ARG_ABLE(chm, [generate doxygen compressed HTML
help documentation],
      m4/ax_prog_doxygen.m4:DX_ARG_ABLE(chi, [generate doxygen seperate
compressed HTML help index file],
      m4/ax_prog_doxygen.m4:DX_ARG_ABLE(html, [generate doxygen plain HTML
documentation],
      m4/ax_prog_doxygen.m4:DX_ARG_ABLE(ps, [generate doxygen PostScript
documentation],
      m4/ax_prog_doxygen.m4:DX_ARG_ABLE(pdf, [generate doxygen PDF documentation],

I could port them all to meson and have options for each one. But, do we really
need all of them or just a subset?

For instance, from [0]:

    $ git grep CONFIGURE_FLAGS.*doxygen
      rules:CONFIGURE_FLAGS += --enable-doxygen-man --disable-doxygen-ps
--disable-doxygen-pdf

Only a few Doxygen options are being used there, but I wonder what are other
projects using... how much Doxygen functionality do we need to support here?

Any comments? :-)

Regards,
Ariel

[0] https://git.launchpad.net/\~libv4l/+git/v4l-utils-packaging
