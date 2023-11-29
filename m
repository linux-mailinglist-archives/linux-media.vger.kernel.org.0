Return-Path: <linux-media+bounces-1301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A73237FCC33
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 02:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C9091F20FC6
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 01:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2997C1FC2;
	Wed, 29 Nov 2023 01:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/bSwZrS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2847E19A6;
	Tue, 28 Nov 2023 17:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701220289; x=1732756289;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=e1Tcz6JC/hrNzvrKel2OmVT+6aP9vDhhqsAeyUcjRk4=;
  b=f/bSwZrSsFdaF+it52pKWqrm/VEql8T8HC1ZdgyEDmVZywbwtoVe3YuX
   Re0uPYBpjMi4Jef4roJo78Sl/SIzQKDLdHBYBWwxTEYuzfWMFi6PgJJzT
   JrSjluJx+tERGW0fDioKAJ1H6M9108yepBStsS+BWGjqfprRqQIrxgxRV
   itJ0qdR/Qc9KGuCm3bDIB9qmwwSKxrPkFm0epTi2MTUwxXVMEJd5NfX0s
   gs/Jpk+fYsigRK05b9V9b6mxWiba5cYDzcgHV4Lo4VUtypqo4H2bIPNSt
   fpRrBGQDIFAOL0URMCPm+ygUz9Q+AJtO0RmN66tYL+LUzNy+HFDFC78DY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="391929082"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="391929082"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:11:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="10171898"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Nov 2023 17:11:27 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r896q-0008NW-0o;
	Wed, 29 Nov 2023 01:11:24 +0000
Date: Wed, 29 Nov 2023 09:11:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [sailus-media-tree:metadata 39/72] htmldocs:
 Documentation/userspace-api/media/glossary.rst:117: WARNING: term not in
 glossary: v4l2 api
Message-ID: <202311290535.b6I99nud-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   d7f1e9eefb0ffe8ed37933b2dbd1806401f5beaf
commit: 74483ddc21a5569afdcb4eca41f6e87771fca980 [39/72] media: Documentation: Add "stream" into glossary
reproduce: (https://download.01.org/0day-ci/archive/20231129/202311290535.b6I99nud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311290535.b6I99nud-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/userspace-api/media/glossary.rst:117: WARNING: term not in glossary: v4l2 api
>> Documentation/userspace-api/media/glossary.rst:130: WARNING: term not in glossary: v4l2 hardware
>> Documentation/userspace-api/media/glossary.rst:207: WARNING: term not in glossary: v4l2 sub-device

vim +117 Documentation/userspace-api/media/glossary.rst

127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   15  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   16      Bridge Driver
1c16b009018deb Mauro Carvalho Chehab 2020-09-25   17  	A :term:`Device Driver` that implements the main logic to talk with
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   18  	media hardware.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   19  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   20      CEC API
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   21  	**Consumer Electronics Control API**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   22  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   23  	An API designed to receive and transmit data via an HDMI
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   24  	CEC interface.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   25  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   26  	See :ref:`cec`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   27  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   28      Device Driver
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   29  	Part of the Linux Kernel that implements support for a hardware
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   30  	component.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   31  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   32      Device Node
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   33  	A character device node in the file system used to control and
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   34  	transfer data in and out of a Kernel driver.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   35  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   36      Digital TV API
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   37  	**Previously known as DVB API**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   38  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   39  	An API designed to control a subset of the :term:`Media Hardware`
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   40  	that implements	digital TV (e. g. DVB, ATSC, ISDB, etc).
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   41  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   42  	See :ref:`dvbapi`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   43  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   44      DSP
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   45          **Digital Signal Processor**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   46  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   47  	A specialized :term:`Microprocessor`, with its architecture
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   48  	optimized for the operational needs of digital signal processing.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   49  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   50      FPGA
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   51  	**Field-programmable Gate Array**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   52  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   53  	An :term:`IC` circuit designed to be configured by a customer or
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   54  	a designer after manufacturing.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   55  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   56  	See https://en.wikipedia.org/wiki/Field-programmable_gate_array.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   57  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   58      Hardware Component
1c16b009018deb Mauro Carvalho Chehab 2020-09-25   59  	A subset of the :term:`Media Hardware`. For example an :term:`I²C` or
1c16b009018deb Mauro Carvalho Chehab 2020-09-25   60  	:term:`SPI` device, or an :term:`IP Block` inside an
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   61  	:term:`SoC` or :term:`FPGA`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   62  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   63      Hardware Peripheral
1c16b009018deb Mauro Carvalho Chehab 2020-09-25   64  	A group of :term:`hardware components <Hardware Component>` that
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   65  	together make a larger user-facing functional peripheral. For
1c16b009018deb Mauro Carvalho Chehab 2020-09-25   66  	instance, the :term:`SoC` :term:`ISP` :term:`IP Block`
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   67  	and the external camera sensors together make a camera hardware
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   68  	peripheral.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   69  
1c16b009018deb Mauro Carvalho Chehab 2020-09-25   70  	Also known as :term:`Peripheral`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   71  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   72      I²C
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   73  	**Inter-Integrated Circuit**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   74  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   75  	A  multi-master, multi-slave, packet switched, single-ended,
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   76  	serial computer bus used to control some hardware components
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   77  	like sub-device hardware components.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   78  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   79  	See http://www.nxp.com/docs/en/user-guide/UM10204.pdf.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   80  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   81      IC
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   82  	**Integrated circuit**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   83  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   84  	A set of electronic circuits on one small flat piece of
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   85  	semiconductor material, normally silicon.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   86  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   87  	Also known as chip.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   88  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   89      IP Block
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   90  	**Intellectual property core**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   91  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   92  	In electronic design a semiconductor intellectual property core,
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   93  	is a reusable unit of logic, cell, or integrated circuit layout
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   94  	design that is the intellectual property of one party.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   95  	IP Blocks may be licensed to another party or can be owned
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   96  	and used by a single party alone.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   97  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   98  	See https://en.wikipedia.org/wiki/Semiconductor_intellectual_property_core).
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25   99  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  100      ISP
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  101  	**Image Signal Processor**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  102  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  103  	A specialized processor that implements a set of algorithms for
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  104  	processing image data. ISPs may implement algorithms for lens
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  105  	shading correction, demosaicing, scaling and pixel format conversion
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  106  	as well as produce statistics for the use of the control
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  107  	algorithms (e.g. automatic exposure, white balance and focus).
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  108  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  109      Media API
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  110  	A set of userspace APIs used to control the media hardware. It is
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  111  	composed by:
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  112  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  113  	  - :term:`CEC API`;
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  114  	  - :term:`Digital TV API`;
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  115  	  - :term:`MC API`;
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  116  	  - :term:`RC API`; and
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25 @117  	  - :term:`V4L2 API`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  118  
d759cd46b9f151 Mauro Carvalho Chehab 2021-06-05  119  	See Documentation/userspace-api/media/index.rst.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  120  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  121      MC API
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  122  	**Media Controller API**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  123  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  124  	An API designed to expose and control the relationships between
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  125  	multimedia devices and sub-devices.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  126  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  127  	See :ref:`media_controller`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  128  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  129      MC-centric
1c16b009018deb Mauro Carvalho Chehab 2020-09-25 @130  	:term:`V4L2 Hardware` device driver that requires :term:`MC API`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  131  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  132  	Such drivers have ``V4L2_CAP_IO_MC`` device_caps field set
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  133  	(see :ref:`VIDIOC_QUERYCAP`).
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  134  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  135  	See :ref:`v4l2_hardware_control` for more details.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  136  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  137      Media Hardware
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  138  	Subset of the hardware that is supported by the Linux Media API.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  139  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  140  	This includes audio and video capture and playback hardware,
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  141  	digital and analog TV, camera sensors, ISPs, remote controllers,
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  142  	codecs, HDMI Consumer Electronics Control, HDMI capture, etc.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  143  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  144      Microprocessor
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  145  	Electronic circuitry that carries out the instructions of a
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  146  	computer program by performing the basic arithmetic, logical,
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  147  	control and input/output (I/O) operations specified by the
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  148  	instructions on a single integrated circuit.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  149  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  150      Peripheral
1c16b009018deb Mauro Carvalho Chehab 2020-09-25  151  	The same as :term:`Hardware Peripheral`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  152  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  153      RC API
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  154  	**Remote Controller API**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  155  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  156  	An API designed to receive and transmit data from remote
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  157  	controllers.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  158  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  159  	See :ref:`remote_controllers`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  160  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  161      SMBus
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  162  	A subset of I²C, which defines a stricter usage of the bus.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  163  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  164      SPI
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  165  	**Serial Peripheral Interface Bus**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  166  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  167  	Synchronous serial communication interface specification used for
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  168  	short distance communication, primarily in embedded systems.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  169  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  170      SoC
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  171  	**System on a Chip**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  172  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  173  	An integrated circuit that integrates all components of a computer
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  174  	or other electronic systems.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  175  
74483ddc21a556 Sakari Ailus          2023-10-11  176  _media-glossary-stream:
74483ddc21a556 Sakari Ailus          2023-10-11  177      Stream
74483ddc21a556 Sakari Ailus          2023-10-11  178  	A distinct flow of data (image data or metadata) from an initial source
74483ddc21a556 Sakari Ailus          2023-10-11  179  	to a final sink. The initial source may be e.g. an image sensor and the
74483ddc21a556 Sakari Ailus          2023-10-11  180  	final sink e.g. a memory buffer.
74483ddc21a556 Sakari Ailus          2023-10-11  181  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  182      V4L2 API
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  183  	**V4L2 userspace API**
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  184  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  185  	The userspace API defined in :ref:`v4l2spec`, which is used to
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  186  	control a V4L2 hardware.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  187  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  188      V4L2 Device Node
1c16b009018deb Mauro Carvalho Chehab 2020-09-25  189  	A :term:`Device Node` that is associated to a V4L driver.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  190  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  191  	The V4L2 device node naming is specified at :ref:`v4l2_device_naming`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  192  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  193      V4L2 Hardware
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  194  	Part of the media hardware which is supported by the :term:`V4L2 API`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  195  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  196      V4L2 Sub-device
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  197  	V4L2 hardware components that aren't controlled by a
1c16b009018deb Mauro Carvalho Chehab 2020-09-25  198  	:term:`Bridge Driver`. See :ref:`subdev`.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  199  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  200      Video-node-centric
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  201  	V4L2 device driver that doesn't require a media controller to be used.
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  202  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  203  	Such drivers have the ``V4L2_CAP_IO_MC`` device_caps field unset
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  204  	(see :ref:`VIDIOC_QUERYCAP`).
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  205  
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25  206      V4L2 Sub-device API
127a2bedac6685 Mauro Carvalho Chehab 2017-08-25 @207  	Part of the :term:`V4L2 API` which control

:::::: The code at line 117 was first introduced by commit
:::::: 127a2bedac6685af5fe73842dfc05265d418ca4a media: docs: add glossary.rst with common terms used at V4L2 spec

:::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

