Return-Path: <linux-media+bounces-37517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBF2B01EDF
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 16:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35D663B147D
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 14:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850762E2EE7;
	Fri, 11 Jul 2025 14:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ZgaXaJID"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2132E54BB
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 14:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752243509; cv=none; b=EseSP4y2/ZwJWrwqhOpj0kRyl2MXTV6gLTeraff1aiRLR+2q9ayxBDFXW0lOZKhIbcuPsTnJcfK2YESjNkHBPoFfF681NJEb4tixSoaaaD+z8LO8XMeJ99aJSkc+q8Y3A8jvile0LAy+znlw4kTFUPTUHzlZA3R9TrfEse4ASO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752243509; c=relaxed/simple;
	bh=F1WRWAekWQtZHnAi8bGdLi7p6cW0x9Nes/+TfR5/Bk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Go+QzhJXSBES7VPdjyifaOp8yRd8qGJIkf6GZUtKxUPW7a+R6H6JeuSgCX9QnlagBr/ufVHiG620TdTxLtPBSKrmWW9mHV+aRpJ8xk4ggRpcTr9sH66JEDKvIgs3Um8k0hhsEeWlqnKS89e1S2mvQBhU/TTsCPO3rtnu5o7tiVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ZgaXaJID; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fada2dd785so23944806d6.2
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 07:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752243507; x=1752848307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RHTH7Vuga5ejUkTj7wZFe5xnlqa1x8LhOx/L5uy3tJ8=;
        b=ZgaXaJID9vMaf7OUDq/ZF1UPmPThJZ6lJMeSqdFv8qSAXSK9u5AsNGAQwV+TcOshG6
         Ax2cKKF2Dh5H6vicn4oEmRTdX+WSZLVpdgKAW9G5ScCFKSV75eeRUgxmogkod8dcyTV/
         gG9kagnBJXvQnukioF0+0FguPlF6sdfU2Qh74VF2ErkSkSq4VmxirP/A/FRLXay/trtw
         HTgpHWJWsSkxYfbz1ZCOwerKC/Vsu5bM7sJZywx6T62Dk9XDch1a/8tm9aH3pVrOOAvU
         V59bio8zZVd9Dz7WrCiu3RSnDhrPNvcHkq8k2NlvYTE1/jaht8fGtoZag1pt5nRUKCUx
         3K7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752243507; x=1752848307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHTH7Vuga5ejUkTj7wZFe5xnlqa1x8LhOx/L5uy3tJ8=;
        b=XQvXV5P9v48ogfPb5MMEte2q7SmSLbHa+Cdb55s/5LZKq35wivaGxoUiAXuMV+SNAw
         yjNISZlQzeHnvmINDH/fvYUaUVk9AkS5IX8dlkfCi6nbPpd7zJ2GkE/tsXX7GPZ8ndRt
         NjsjRoQyTO27fq7PQqIgJeK7PQSKAunv/Aoj1Tr7GG2lXtNe8Ry4fkE5wB6PJ47z04Ux
         dokMjyTa5h8LXZoCAF4Rq5ydOUDUQ1IbxCj/uEEMJ75+m6+b3h31EBaQgaaMOOWuUn92
         zHECU3AZtbhMKNiR3KLyXFXI1tDdCdqXpR+m6Mua39pld2ryIJAOlSi34V7fF1i5lDns
         Qpzw==
X-Forwarded-Encrypted: i=1; AJvYcCUspHdZr+W+0Jcnc/S6aHPpAKmKhUBtzBtULgapcoVh72rGQN3f6G/AKwhFZwB8Fl+0MV7bh9BZzdGdGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcARjqL1RETs7wUe+SZlH9V2NrWX210hU4jmqBfZodHs1/+NIU
	V8GngLBQJ+k32ULrSuYbqtgo1zppt3Pc5I4CbkH7tVe4USeQozx2pXMP5mUIGQLExw==
X-Gm-Gg: ASbGncsid9D/lQeS/8iNFF92l5dz+kct5oDv178iPDUsOyQC8jFBttcOYQupAnYaYcG
	nnETxHtzm90dTY97ILaqWd5ONnOTROrNW312xl84d7E1sNbbbUTd+PuMlyuDuuHv+oQu11XU/ID
	PdWxmapBzZk+BqCJSATMnWl/j7CstCCLZnc7bMsA+G5/V2IXvz0lFG2/2j+b4tY6SYdJtLkNF4E
	gmDyMz/JpbTvzIscprzCJT9Cdvdb8acxRmLWK2dfwYTJ/7nzSvf0/9b/u9+ghi5aIwyZBxSnNpG
	LjER7goTWMF6KG7zI9o2esV2JjeXjO0wqOdIz8igCa2P+xya9oy19VDu+HXgrN9gssq0u1x83nI
	sGmZK71q/f0PKYRwpTBjCEBCOW+OAxFF5Weqg57wnrmjR2SNCQ2Q=
X-Google-Smtp-Source: AGHT+IHU/emKwl2r5Gsfn2eSCOzvWx5Z0u+fK8xNQLhA1dsfDA0OUcsG+9XKJSF1ohNPCpyql2L55Q==
X-Received: by 2002:a05:6214:2b0e:b0:704:9840:b080 with SMTP id 6a1803df08f44-704a3612c94mr61250326d6.17.1752243506815;
        Fri, 11 Jul 2025 07:18:26 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d8eee2sm20123376d6.97.2025.07.11.07.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 07:18:25 -0700 (PDT)
Date: Fri, 11 Jul 2025 10:18:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com, Thinh.Nguyen@synopsys.com,
	Amardeep Rai <amardeep.rai@intel.com>,
	Kannappan R <r.kannappan@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
Message-ID: <50dc348f-1751-4fe3-b5d0-9336280f07b3@rowland.harvard.edu>
References: <20250711083413.1552423-1-sakari.ailus@linux.intel.com>
 <20250711083413.1552423-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711083413.1552423-4-sakari.ailus@linux.intel.com>

On Fri, Jul 11, 2025 at 11:34:12AM +0300, Sakari Ailus wrote:
> From: "Rai, Amardeep" <amardeep.rai@intel.com>
> 
> Add usb_endpoint_max_isoc_bpi() to obtain maximum bytes per interval for
> isochronous endpoints in a USB version independent way.
> 
> Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/linux/usb.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 68166718ab30..bd70bd5ca82d 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -2038,6 +2038,28 @@ static inline int usb_translate_errors(int error_code)
>  	}
>  }
>  
> +static inline u32 usb_endpoint_max_isoc_bpi(struct usb_device *dev,
> +					    const struct usb_host_endpoint *ep)

The name "usb_endpoint_max_isoc_bpi" is sufficiently obscure that it 
deserves a kerneldoc comment saying what the function does.

Alan Stern

