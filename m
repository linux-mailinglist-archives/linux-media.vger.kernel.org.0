Return-Path: <linux-media+bounces-45663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C4FC0E206
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 14:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAC60425BA6
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 13:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B788306D48;
	Mon, 27 Oct 2025 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dESnDn6X"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB5B27978C;
	Mon, 27 Oct 2025 13:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761572151; cv=none; b=DBN6fJggyrKD4NVl9VMVRcoR+B3fIqGFP4JpNOSIB/LGbGo8418yPNxOBD07MnV2j0VtXQXo6hWRe0AX8FTkX52Q1stFNVCmVj1sEkPdXxANbbzJjuRsBtviYnFlsvP6KwRYqGTnfw93CGvGjdS4ZbuN2AAFzDLyj3yy0A1MP2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761572151; c=relaxed/simple;
	bh=vFs15ZIx41UL2XcePA0E+aw0tuFp2rqL/CTFrXsbuAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sK+bi8u+YvodkGL+tDrKrwziqmO6DBxfb55hrLTtS/5X+edEL2MX/Dr7TAAlng3XEQ75xgXwzjWcVjDtr+6u8u4WxUq1sONUJm4H/wor9w/Iv3a90Um7bPLmj0nOay4UaF6IHwlzn/UaZeb5tFwjxZWP+CoBWfbQys+eK8GE/uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dESnDn6X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDA6C4CEFF;
	Mon, 27 Oct 2025 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761572151;
	bh=vFs15ZIx41UL2XcePA0E+aw0tuFp2rqL/CTFrXsbuAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dESnDn6XGoJu0NV72DirVvS0w0lEmcKXDo67y1CpqBdJik9kHuaz15Vq+Xe/dhelN
	 YuVrxl67r+kxkUDOYATL0gesoBw8jWgULgP5XNFDy2yzPhQw8v74KfQFHIqNU6o0uy
	 kwwMaBgBflfL/4EquqUmW3EHEigmmLPb2j6qtW/W3gq58USm71V6RYg/J+Mk2FrkGx
	 6+ywbCQ6cUyKj1H5K9qQMTav9h9nwV+/mBKB3TVijKBdDE5Z9X8Z6NIX8v9Q9S5SsW
	 tycRNnZvCvOczVfJ8Gfbs63HcYOla9JiVN3IEk9jBNOoao9U3wCVDiZcXzCTGex41k
	 piJq5ZxVdZzKQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vDNO6-000000000Hi-3Jxw;
	Mon, 27 Oct 2025 14:35:54 +0100
Date: Mon, 27 Oct 2025 14:35:54 +0100
From: Johan Hovold <johan@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH] media: c8sectpfe: fix probe device leaks
Message-ID: <aP91OoGkrSxxpsf1@hovoldconsulting.com>
References: <20250923151605.17689-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923151605.17689-1-johan@kernel.org>

On Tue, Sep 23, 2025 at 05:16:05PM +0200, Johan Hovold wrote:
> Make sure to drop the references taken to the I2C adapters during probe
> on probe failure (e.g. probe deferral) and on driver unbind.
> 
> Fixes: c5f5d0f99794 ("[media] c8sectpfe: STiH407/10 Linux DVB demux support")
> Cc: stable@vger.kernel.org	# 4.3
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Can this one be picked up for 6.19?

Johan

